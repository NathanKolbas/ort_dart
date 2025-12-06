use flutter_rust_bridge::frb;
use ort::{Error, Result};
use ort::memory::{AllocationDevice as OrtAllocationDevice};
pub use ort::memory::{AllocatorType, DeviceType, MemoryType};
use crate::api::tensor::TensorImpl;

/// Represents possible devices that have their own device allocator.
pub enum AllocationDevice {
  Cpu,
  Cuda,
  CudaPinned,
  Cann,
  CannPinned,
  DirectML,
  Hip,
  HipPinned,
  OpenVinoCpu,
  OpenVinoGpu,
  QnnHtpShared,
  WebGpuBuffer,

  /// A [AllocationDevice] that is not known in the predefined devices.
  Other(String),
}

impl AllocationDevice {
  #[frb(ignore)]
  pub fn from_str(str: &str) -> Self {
    match str {
      "Cpu" => {
        AllocationDevice::Cpu
      },
      "Cuda" => {
        AllocationDevice::Cuda
      },
      "CudaPinned" => {
        AllocationDevice::CudaPinned
      },
      "Cann" => {
        AllocationDevice::Cann
      },
      "CannPinned" => {
        AllocationDevice::CannPinned
      },
      "DML" => {
        AllocationDevice::DirectML
      },
      "Hip" => {
        AllocationDevice::Hip
      },
      "HipPinned" => {
        AllocationDevice::HipPinned
      },
      "OpenVINO_CPU" => {
        AllocationDevice::OpenVinoCpu
      },
      "OpenVINO_GPU" => {
        AllocationDevice::OpenVinoGpu
      },
      "QnnHtpShared" => {
        AllocationDevice::QnnHtpShared
      },
      "WebGPU_Buffer" => {
        AllocationDevice::WebGpuBuffer
      },
      _ => {
        AllocationDevice::Other(String::from(str))
      }
    }
  }

  #[frb(ignore)]
  pub fn to_ort_allocation_device(&self) -> Result<OrtAllocationDevice> {
    match self {
      AllocationDevice::Cpu => {
        Ok(OrtAllocationDevice::CPU)
      },
      AllocationDevice::Cuda => {
        Ok(OrtAllocationDevice::CUDA)
      },
      AllocationDevice::CudaPinned => {
        Ok(OrtAllocationDevice::CUDA_PINNED)
      },
      AllocationDevice::Cann => {
        Ok(OrtAllocationDevice::CANN)
      },
      AllocationDevice::CannPinned => {
        Ok(OrtAllocationDevice::CANN_PINNED)
      },
      AllocationDevice::DirectML => {
        Ok(OrtAllocationDevice::DIRECTML)
      },
      AllocationDevice::Hip => {
        Ok(OrtAllocationDevice::HIP)
      },
      AllocationDevice::HipPinned => {
        Ok(OrtAllocationDevice::HIP_PINNED)
      },
      AllocationDevice::OpenVinoCpu => {
        Ok(OrtAllocationDevice::OPENVINO_CPU)
      },
      AllocationDevice::OpenVinoGpu => {
        Ok(OrtAllocationDevice::OPENVINO_GPU)
      },
      AllocationDevice::QnnHtpShared => {
        Ok(OrtAllocationDevice::QNN_HTP_SHARED)
      },
      AllocationDevice::WebGpuBuffer => {
        Ok(OrtAllocationDevice::WEBGPU_BUFFER)
      },
      AllocationDevice::Other(str) => {
        Err(Error::new(format!("Unknown or unimplemented allocation: {}", str)))
      }
    }
  }
}

/// Execution provider allocator type.
#[frb(mirror(AllocatorType))]
pub enum _AllocatorType {
  /// Default device-specific allocator.
  Device,
  /// Arena allocator.
  Arena
}

#[frb(mirror(DeviceType))]
#[allow(clippy::upper_case_acronyms)]
pub enum _DeviceType {
  CPU,
  GPU,
  FPGA
}

/// Memory types for allocated memory.
#[frb(mirror(MemoryType))]
pub enum _MemoryType {
  /// Any CPU memory used by non-CPU execution provider.
  CPUInput,
  /// CPU-accessible memory output by a non-CPU execution provider, i.e. [`AllocationDevice::CudaPinned`].
  CPUOutput,
  /// The default (typically device memory) allocator for an execution provider.
  Default
}

/// Describes allocation properties for value memory.
///
/// `MemoryInfo` is used in the creation of [`Session`]s, [`Allocator`]s, and [`Value`]s to describe on which
/// device value data should reside, and how that data should be accessible with regard to the CPU (if a non-CPU device
/// is requested).
///
/// [`Value`]: crate::value::Value
pub struct MemoryInfo {
  ptr: TensorImpl,
}

impl MemoryInfo {
  /// Creates a [`MemoryInfo`], describing a memory location on a device allocator.
  ///
  /// # Examples
  /// `MemoryInfo` can be used to specify the device & memory type used by an [`Allocator`] to allocate tensors.
  /// See [`Allocator`] for more information & potential applications.
  /// ```no_run
  /// # use ort::{memory::{Allocator, MemoryInfo, MemoryType, AllocationDevice, AllocatorType}, session::Session, value::Tensor};
  /// # fn main() -> ort::Result<()> {
  /// # let session = Session::builder()?.commit_from_file("tests/data/upsample.onnx")?;
  /// let allocator = Allocator::new(
  /// 	&session,
  /// 	MemoryInfo::new(AllocationDevice::CUDA, 0, AllocatorType::Device, MemoryType::Default)?
  /// )?;
  ///
  /// let mut tensor = Tensor::<f32>::new(&allocator, [1_usize, 3, 224, 224])?;
  /// # Ok(())
  /// # }
  /// ```
  #[frb(ignore)]
  pub fn new(tensor: TensorImpl) -> Result<Self> {
    Ok(Self {
      ptr: tensor,
    })
  }

  // All getter functions are (at least currently) infallible - they simply just dereference the corresponding fields,
  // and always return `nullptr` for the status; so none of these have to return `Result`s.
  // https://github.com/microsoft/onnxruntime/blob/v1.23.1/onnxruntime/core/framework/allocator.cc#L304

  /// Returns the [`MemoryType`] described by this struct.
  /// ```
  /// # use ort::memory::{MemoryInfo, MemoryType, AllocationDevice, AllocatorType};
  /// # fn main() -> ort::Result<()> {
  /// let mem = MemoryInfo::new(AllocationDevice::CPU, 0, AllocatorType::Device, MemoryType::Default)?;
  /// assert_eq!(mem.memory_type(), MemoryType::Default);
  /// # Ok(())
  /// # }
  /// ```
  #[frb(sync)]
  pub fn memory_type(&self) -> MemoryType {
    self.ptr.tensor.memory_info().memory_type()
  }

  /// Returns the [`AllocatorType`] described by this struct.
  /// ```
  /// # use ort::memory::{MemoryInfo, MemoryType, AllocationDevice, AllocatorType};
  /// # fn main() -> ort::Result<()> {
  /// let mem = MemoryInfo::new(AllocationDevice::CPU, 0, AllocatorType::Device, MemoryType::Default)?;
  /// assert_eq!(mem.allocator_type(), AllocatorType::Device);
  /// # Ok(())
  /// # }
  /// ```
  #[frb(sync)]
  pub fn allocator_type(&self) -> AllocatorType {
    self.ptr.tensor.memory_info().allocator_type()
  }

  /// Returns the [`AllocationDevice`] this struct was created with.
  /// ```
  /// # use ort::memory::{MemoryInfo, MemoryType, AllocationDevice, AllocatorType};
  /// # fn main() -> ort::Result<()> {
  /// let mem = MemoryInfo::new(AllocationDevice::CPU, 0, AllocatorType::Device, MemoryType::Default)?;
  /// assert_eq!(mem.allocation_device(), AllocationDevice::CPU);
  /// # Ok(())
  /// # }
  /// ```
  #[frb(sync)]
  pub fn allocation_device(&self) -> AllocationDevice {
    AllocationDevice::from_str(self.ptr.tensor.memory_info().allocation_device().as_str())
  }

  /// Returns the ID of the [`AllocationDevice`] described by this struct.
  /// ```
  /// # use ort::memory::{MemoryInfo, MemoryType, AllocationDevice, AllocatorType};
  /// # fn main() -> ort::Result<()> {
  /// let mem = MemoryInfo::new(AllocationDevice::CPU, 0, AllocatorType::Device, MemoryType::Default)?;
  /// assert_eq!(mem.device_id(), 0);
  /// # Ok(())
  /// # }
  /// ```
  #[frb(sync)]
  pub fn device_id(&self) -> i32 {
    self.ptr.tensor.memory_info().device_id()
  }

  /// Returns the type of device (CPU/GPU) this memory is allocated on.
  #[frb(sync)]
  pub fn device_type(&self) -> DeviceType {
    self.ptr.tensor.memory_info().device_type()
  }

  /// Returns `true` if this memory is accessible by the CPU; meaning that, if a value were allocated on this device,
  /// it could be extracted to an `ndarray` or slice.
  #[frb(sync)]
  pub fn is_cpu_accessible(&self) -> bool {
    self.ptr.tensor.memory_info().is_cpu_accessible()
  }
}

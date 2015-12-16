From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm v3 01/14] nouveau: import and install a
 selection of nvif headers from the kernel
Date: Thu, 17 Dec 2015 09:31:42 +1000
Message-ID: <5671F45E.1080701@gmail.com>
References: <1450308070-11707-1-git-send-email-skeggsb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1180991314=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1450308070-11707-1-git-send-email-skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1180991314==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UjfmQugIAoI1NODH06TSHuMfgvphTB1th"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UjfmQugIAoI1NODH06TSHuMfgvphTB1th
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/17/2015 09:20 AM, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> This commit also modifies the install path of the main libdrm_nouveau
> header to be under a nouveau/ subdirectory.
Hey Emil, Ilia, Samuel,

You guys have all done various bits of review on the libdrm/mesa series,
would I be able to get you guys to have a final look-over to make sure
everything has been addressed, and give your R-b's?

Thanks,
Ben.

>=20
> Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  include/drm/nouveau_drm.h    |   1 +
>  nouveau/Makefile.am          |  11 +++-
>  nouveau/libdrm_nouveau.pc.in |   2 +-
>  nouveau/nvif/cl0080.h        |  45 ++++++++++++++
>  nouveau/nvif/cl9097.h        |  44 ++++++++++++++
>  nouveau/nvif/class.h         | 141 +++++++++++++++++++++++++++++++++++=
++++++++
>  nouveau/nvif/if0002.h        |  38 ++++++++++++
>  nouveau/nvif/if0003.h        |  33 ++++++++++
>  nouveau/nvif/ioctl.h         | 132 +++++++++++++++++++++++++++++++++++=
+++++
>  nouveau/nvif/unpack.h        |  28 +++++++++
>  10 files changed, 473 insertions(+), 2 deletions(-)
>  create mode 100644 nouveau/nvif/cl0080.h
>  create mode 100644 nouveau/nvif/cl9097.h
>  create mode 100644 nouveau/nvif/class.h
>  create mode 100644 nouveau/nvif/if0002.h
>  create mode 100644 nouveau/nvif/if0003.h
>  create mode 100644 nouveau/nvif/ioctl.h
>  create mode 100644 nouveau/nvif/unpack.h
>=20
> diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
> index 87aefc5..e418f9f 100644
> --- a/include/drm/nouveau_drm.h
> +++ b/include/drm/nouveau_drm.h
> @@ -200,6 +200,7 @@ struct drm_nouveau_sarea {
>  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04
>  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05
>  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06
> +#define DRM_NOUVEAU_NVIF               0x07
>  #define DRM_NOUVEAU_GEM_NEW            0x40
>  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
> index 25ea6dc..76cdeca 100644
> --- a/nouveau/Makefile.am
> +++ b/nouveau/Makefile.am
> @@ -14,9 +14,18 @@ libdrm_nouveau_la_LIBADD =3D ../libdrm.la @PTHREADST=
UBS_LIBS@
> =20
>  libdrm_nouveau_la_SOURCES =3D $(LIBDRM_NOUVEAU_FILES)
> =20
> -libdrm_nouveauincludedir =3D ${includedir}/libdrm
> +libdrm_nouveauincludedir =3D ${includedir}/libdrm/nouveau
>  libdrm_nouveauinclude_HEADERS =3D $(LIBDRM_NOUVEAU_H_FILES)
> =20
> +libdrm_nouveaunvifincludedir =3D ${includedir}/libdrm/nouveau/nvif
> +libdrm_nouveaunvifinclude_HEADERS =3D nvif/class.h \
> +				    nvif/cl0080.h \
> +				    nvif/cl9097.h \
> +				    nvif/if0002.h \
> +				    nvif/if0003.h \
> +				    nvif/ioctl.h \
> +				    nvif/unpack.h
> +
>  pkgconfigdir =3D @pkgconfigdir@
>  pkgconfig_DATA =3D libdrm_nouveau.pc
> =20
> diff --git a/nouveau/libdrm_nouveau.pc.in b/nouveau/libdrm_nouveau.pc.i=
n
> index 9abfd81..7d0622e 100644
> --- a/nouveau/libdrm_nouveau.pc.in
> +++ b/nouveau/libdrm_nouveau.pc.in
> @@ -7,5 +7,5 @@ Name: libdrm_nouveau
>  Description: Userspace interface to nouveau kernel DRM services
>  Version: @PACKAGE_VERSION@
>  Libs: -L${libdir} -ldrm_nouveau
> -Cflags: -I${includedir} -I${includedir}/libdrm
> +Cflags: -I${includedir} -I${includedir}/libdrm -I${includedir}/libdrm/=
nouveau
>  Requires.private: libdrm
> diff --git a/nouveau/nvif/cl0080.h b/nouveau/nvif/cl0080.h
> new file mode 100644
> index 0000000..331620a
> --- /dev/null
> +++ b/nouveau/nvif/cl0080.h
> @@ -0,0 +1,45 @@
> +#ifndef __NVIF_CL0080_H__
> +#define __NVIF_CL0080_H__
> +
> +struct nv_device_v0 {
> +	__u8  version;
> +	__u8  pad01[7];
> +	__u64 device;	/* device identifier, ~0 for client default */
> +};
> +
> +#define NV_DEVICE_V0_INFO                                             =
     0x00
> +#define NV_DEVICE_V0_TIME                                             =
     0x01
> +
> +struct nv_device_info_v0 {
> +	__u8  version;
> +#define NV_DEVICE_INFO_V0_IGP                                         =
     0x00
> +#define NV_DEVICE_INFO_V0_PCI                                         =
     0x01
> +#define NV_DEVICE_INFO_V0_AGP                                         =
     0x02
> +#define NV_DEVICE_INFO_V0_PCIE                                        =
     0x03
> +#define NV_DEVICE_INFO_V0_SOC                                         =
     0x04
> +	__u8  platform;
> +	__u16 chipset;	/* from NV_PMC_BOOT_0 */
> +	__u8  revision;	/* from NV_PMC_BOOT_0 */
> +#define NV_DEVICE_INFO_V0_TNT                                         =
     0x01
> +#define NV_DEVICE_INFO_V0_CELSIUS                                     =
     0x02
> +#define NV_DEVICE_INFO_V0_KELVIN                                      =
     0x03
> +#define NV_DEVICE_INFO_V0_RANKINE                                     =
     0x04
> +#define NV_DEVICE_INFO_V0_CURIE                                       =
     0x05
> +#define NV_DEVICE_INFO_V0_TESLA                                       =
     0x06
> +#define NV_DEVICE_INFO_V0_FERMI                                       =
     0x07
> +#define NV_DEVICE_INFO_V0_KEPLER                                      =
     0x08
> +#define NV_DEVICE_INFO_V0_MAXWELL                                     =
     0x09
> +	__u8  family;
> +	__u8  pad06[2];
> +	__u64 ram_size;
> +	__u64 ram_user;
> +	char  chip[16];
> +	char  name[64];
> +};
> +
> +struct nv_device_time_v0 {
> +	__u8  version;
> +	__u8  pad01[7];
> +	__u64 time;
> +};
> +#endif
> diff --git a/nouveau/nvif/cl9097.h b/nouveau/nvif/cl9097.h
> new file mode 100644
> index 0000000..4057676
> --- /dev/null
> +++ b/nouveau/nvif/cl9097.h
> @@ -0,0 +1,44 @@
> +#ifndef __NVIF_CL9097_H__
> +#define __NVIF_CL9097_H__
> +
> +#define FERMI_A_ZBC_COLOR                                             =
     0x00
> +#define FERMI_A_ZBC_DEPTH                                             =
     0x01
> +
> +struct fermi_a_zbc_color_v0 {
> +	__u8  version;
> +#define FERMI_A_ZBC_COLOR_V0_FMT_ZERO                                 =
     0x01
> +#define FERMI_A_ZBC_COLOR_V0_FMT_UNORM_ONE                            =
     0x02
> +#define FERMI_A_ZBC_COLOR_V0_FMT_RF32_GF32_BF32_AF32                  =
     0x04
> +#define FERMI_A_ZBC_COLOR_V0_FMT_R16_G16_B16_A16                      =
     0x08
> +#define FERMI_A_ZBC_COLOR_V0_FMT_RN16_GN16_BN16_AN16                  =
     0x0c
> +#define FERMI_A_ZBC_COLOR_V0_FMT_RS16_GS16_BS16_AS16                  =
     0x10
> +#define FERMI_A_ZBC_COLOR_V0_FMT_RU16_GU16_BU16_AU16                  =
     0x14
> +#define FERMI_A_ZBC_COLOR_V0_FMT_RF16_GF16_BF16_AF16                  =
     0x16
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A8R8G8B8                             =
     0x18
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A8RL8GL8BL8                          =
     0x1c
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A2B10G10R10                          =
     0x20
> +#define FERMI_A_ZBC_COLOR_V0_FMT_AU2BU10GU10RU10                      =
     0x24
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A8B8G8R8                             =
     0x28
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A8BL8GL8RL8                          =
     0x2c
> +#define FERMI_A_ZBC_COLOR_V0_FMT_AN8BN8GN8RN8                         =
     0x30
> +#define FERMI_A_ZBC_COLOR_V0_FMT_AS8BS8GS8RS8                         =
     0x34
> +#define FERMI_A_ZBC_COLOR_V0_FMT_AU8BU8GU8RU8                         =
     0x38
> +#define FERMI_A_ZBC_COLOR_V0_FMT_A2R10G10B10                          =
     0x3c
> +#define FERMI_A_ZBC_COLOR_V0_FMT_BF10GF11RF11                         =
     0x40
> +	__u8  format;
> +	__u8  index;
> +	__u8  pad03[5];
> +	__u32 ds[4];
> +	__u32 l2[4];
> +};
> +
> +struct fermi_a_zbc_depth_v0 {
> +	__u8  version;
> +#define FERMI_A_ZBC_DEPTH_V0_FMT_FP32                                 =
     0x01
> +	__u8  format;
> +	__u8  index;
> +	__u8  pad03[5];
> +	__u32 ds;
> +	__u32 l2;
> +};
> +#endif
> diff --git a/nouveau/nvif/class.h b/nouveau/nvif/class.h
> new file mode 100644
> index 0000000..4179cd6
> --- /dev/null
> +++ b/nouveau/nvif/class.h
> @@ -0,0 +1,141 @@
> +#ifndef __NVIF_CLASS_H__
> +#define __NVIF_CLASS_H__
> +
> +/* these class numbers are made up by us, and not nvidia-assigned */
> +#define NVIF_CLASS_CONTROL                                    /* if000=
1.h */ -1
> +#define NVIF_CLASS_PERFMON                                    /* if000=
2.h */ -2
> +#define NVIF_CLASS_PERFDOM                                    /* if000=
3.h */ -3
> +#define NVIF_CLASS_SW_NV04                                    /* if000=
4.h */ -4
> +#define NVIF_CLASS_SW_NV10                                    /* if000=
5.h */ -5
> +#define NVIF_CLASS_SW_NV50                                    /* if000=
5.h */ -6
> +#define NVIF_CLASS_SW_GF100                                   /* if000=
5.h */ -7
> +
> +/* the below match nvidia-assigned (either in hw, or sw) class numbers=
 */
> +#define NV_DEVICE                                     /* cl0080.h */ 0=
x00000080
> +
> +#define NV_DMA_FROM_MEMORY                            /* cl0002.h */ 0=
x00000002
> +#define NV_DMA_TO_MEMORY                              /* cl0002.h */ 0=
x00000003
> +#define NV_DMA_IN_MEMORY                              /* cl0002.h */ 0=
x0000003d
> +
> +#define FERMI_TWOD_A                                                 0=
x0000902d
> +
> +#define FERMI_MEMORY_TO_MEMORY_FORMAT_A                              0=
x00009039
> +
> +#define KEPLER_INLINE_TO_MEMORY_A                                    0=
x0000a040
> +#define KEPLER_INLINE_TO_MEMORY_B                                    0=
x0000a140
> +
> +#define NV04_DISP                                     /* cl0046.h */ 0=
x00000046
> +
> +#define NV03_CHANNEL_DMA                              /* cl506b.h */ 0=
x0000006b
> +#define NV10_CHANNEL_DMA                              /* cl506b.h */ 0=
x0000006e
> +#define NV17_CHANNEL_DMA                              /* cl506b.h */ 0=
x0000176e
> +#define NV40_CHANNEL_DMA                              /* cl506b.h */ 0=
x0000406e
> +#define NV50_CHANNEL_DMA                              /* cl506e.h */ 0=
x0000506e
> +#define G82_CHANNEL_DMA                               /* cl826e.h */ 0=
x0000826e
> +
> +#define NV50_CHANNEL_GPFIFO                           /* cl506f.h */ 0=
x0000506f
> +#define G82_CHANNEL_GPFIFO                            /* cl826f.h */ 0=
x0000826f
> +#define FERMI_CHANNEL_GPFIFO                          /* cl906f.h */ 0=
x0000906f
> +#define KEPLER_CHANNEL_GPFIFO_A                       /* cla06f.h */ 0=
x0000a06f
> +#define MAXWELL_CHANNEL_GPFIFO_A                      /* cla06f.h */ 0=
x0000b06f
> +
> +#define NV50_DISP                                     /* cl5070.h */ 0=
x00005070
> +#define G82_DISP                                      /* cl5070.h */ 0=
x00008270
> +#define GT200_DISP                                    /* cl5070.h */ 0=
x00008370
> +#define GT214_DISP                                    /* cl5070.h */ 0=
x00008570
> +#define GT206_DISP                                    /* cl5070.h */ 0=
x00008870
> +#define GF110_DISP                                    /* cl5070.h */ 0=
x00009070
> +#define GK104_DISP                                    /* cl5070.h */ 0=
x00009170
> +#define GK110_DISP                                    /* cl5070.h */ 0=
x00009270
> +#define GM107_DISP                                    /* cl5070.h */ 0=
x00009470
> +#define GM204_DISP                                    /* cl5070.h */ 0=
x00009570
> +
> +#define NV31_MPEG                                                    0=
x00003174
> +#define G82_MPEG                                                     0=
x00008274
> +
> +#define NV74_VP2                                                     0=
x00007476
> +
> +#define NV50_DISP_CURSOR                              /* cl507a.h */ 0=
x0000507a
> +#define G82_DISP_CURSOR                               /* cl507a.h */ 0=
x0000827a
> +#define GT214_DISP_CURSOR                             /* cl507a.h */ 0=
x0000857a
> +#define GF110_DISP_CURSOR                             /* cl507a.h */ 0=
x0000907a
> +#define GK104_DISP_CURSOR                             /* cl507a.h */ 0=
x0000917a
> +
> +#define NV50_DISP_OVERLAY                             /* cl507b.h */ 0=
x0000507b
> +#define G82_DISP_OVERLAY                              /* cl507b.h */ 0=
x0000827b
> +#define GT214_DISP_OVERLAY                            /* cl507b.h */ 0=
x0000857b
> +#define GF110_DISP_OVERLAY                            /* cl507b.h */ 0=
x0000907b
> +#define GK104_DISP_OVERLAY                            /* cl507b.h */ 0=
x0000917b
> +
> +#define NV50_DISP_BASE_CHANNEL_DMA                    /* cl507c.h */ 0=
x0000507c
> +#define G82_DISP_BASE_CHANNEL_DMA                     /* cl507c.h */ 0=
x0000827c
> +#define GT200_DISP_BASE_CHANNEL_DMA                   /* cl507c.h */ 0=
x0000837c
> +#define GT214_DISP_BASE_CHANNEL_DMA                   /* cl507c.h */ 0=
x0000857c
> +#define GF110_DISP_BASE_CHANNEL_DMA                   /* cl507c.h */ 0=
x0000907c
> +#define GK104_DISP_BASE_CHANNEL_DMA                   /* cl507c.h */ 0=
x0000917c
> +#define GK110_DISP_BASE_CHANNEL_DMA                   /* cl507c.h */ 0=
x0000927c
> +
> +#define NV50_DISP_CORE_CHANNEL_DMA                    /* cl507d.h */ 0=
x0000507d
> +#define G82_DISP_CORE_CHANNEL_DMA                     /* cl507d.h */ 0=
x0000827d
> +#define GT200_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000837d
> +#define GT214_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000857d
> +#define GT206_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000887d
> +#define GF110_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000907d
> +#define GK104_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000917d
> +#define GK110_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000927d
> +#define GM107_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000947d
> +#define GM204_DISP_CORE_CHANNEL_DMA                   /* cl507d.h */ 0=
x0000957d
> +
> +#define NV50_DISP_OVERLAY_CHANNEL_DMA                 /* cl507e.h */ 0=
x0000507e
> +#define G82_DISP_OVERLAY_CHANNEL_DMA                  /* cl507e.h */ 0=
x0000827e
> +#define GT200_DISP_OVERLAY_CHANNEL_DMA                /* cl507e.h */ 0=
x0000837e
> +#define GT214_DISP_OVERLAY_CHANNEL_DMA                /* cl507e.h */ 0=
x0000857e
> +#define GF110_DISP_OVERLAY_CONTROL_DMA                /* cl507e.h */ 0=
x0000907e
> +#define GK104_DISP_OVERLAY_CONTROL_DMA                /* cl507e.h */ 0=
x0000917e
> +
> +#define FERMI_A                                       /* cl9097.h */ 0=
x00009097
> +#define FERMI_B                                       /* cl9097.h */ 0=
x00009197
> +#define FERMI_C                                       /* cl9097.h */ 0=
x00009297
> +
> +#define KEPLER_A                                      /* cl9097.h */ 0=
x0000a097
> +#define KEPLER_B                                      /* cl9097.h */ 0=
x0000a197
> +#define KEPLER_C                                      /* cl9097.h */ 0=
x0000a297
> +
> +#define MAXWELL_A                                     /* cl9097.h */ 0=
x0000b097
> +#define MAXWELL_B                                     /* cl9097.h */ 0=
x0000b197
> +
> +#define NV74_BSP                                                     0=
x000074b0
> +
> +#define GT212_MSVLD                                                  0=
x000085b1
> +#define IGT21A_MSVLD                                                 0=
x000086b1
> +#define G98_MSVLD                                                    0=
x000088b1
> +#define GF100_MSVLD                                                  0=
x000090b1
> +#define GK104_MSVLD                                                  0=
x000095b1
> +
> +#define GT212_MSPDEC                                                 0=
x000085b2
> +#define G98_MSPDEC                                                   0=
x000088b2
> +#define GF100_MSPDEC                                                 0=
x000090b2
> +#define GK104_MSPDEC                                                 0=
x000095b2
> +
> +#define GT212_MSPPP                                                  0=
x000085b3
> +#define G98_MSPPP                                                    0=
x000088b3
> +#define GF100_MSPPP                                                  0=
x000090b3
> +
> +#define G98_SEC                                                      0=
x000088b4
> +
> +#define GT212_DMA                                                    0=
x000085b5
> +#define FERMI_DMA                                                    0=
x000090b5
> +#define KEPLER_DMA_COPY_A                                            0=
x0000a0b5
> +#define MAXWELL_DMA_COPY_A                                           0=
x0000b0b5
> +
> +#define FERMI_DECOMPRESS                                             0=
x000090b8
> +
> +#define FERMI_COMPUTE_A                                              0=
x000090c0
> +#define FERMI_COMPUTE_B                                              0=
x000091c0
> +#define KEPLER_COMPUTE_A                                             0=
x0000a0c0
> +#define KEPLER_COMPUTE_B                                             0=
x0000a1c0
> +#define MAXWELL_COMPUTE_A                                            0=
x0000b0c0
> +#define MAXWELL_COMPUTE_B                                            0=
x0000b1c0
> +
> +#define NV74_CIPHER                                                  0=
x000074c1
> +#endif
> diff --git a/nouveau/nvif/if0002.h b/nouveau/nvif/if0002.h
> new file mode 100644
> index 0000000..c04c91d
> --- /dev/null
> +++ b/nouveau/nvif/if0002.h
> @@ -0,0 +1,38 @@
> +#ifndef __NVIF_IF0002_H__
> +#define __NVIF_IF0002_H__
> +
> +#define NVIF_PERFMON_V0_QUERY_DOMAIN                                  =
     0x00
> +#define NVIF_PERFMON_V0_QUERY_SIGNAL                                  =
     0x01
> +#define NVIF_PERFMON_V0_QUERY_SOURCE                                  =
     0x02
> +
> +struct nvif_perfmon_query_domain_v0 {
> +	__u8  version;
> +	__u8  id;
> +	__u8  counter_nr;
> +	__u8  iter;
> +	__u16 signal_nr;
> +	__u8  pad05[2];
> +	char  name[64];
> +};
> +
> +struct nvif_perfmon_query_signal_v0 {
> +	__u8  version;
> +	__u8  domain;
> +	__u16 iter;
> +	__u8  signal;
> +	__u8  source_nr;
> +	__u8  pad05[2];
> +	char  name[64];
> +};
> +
> +struct nvif_perfmon_query_source_v0 {
> +	__u8  version;
> +	__u8  domain;
> +	__u8  signal;
> +	__u8  iter;
> +	__u8  pad04[4];
> +	__u32 source;
> +	__u32 mask;
> +	char  name[64];
> +};
> +#endif
> diff --git a/nouveau/nvif/if0003.h b/nouveau/nvif/if0003.h
> new file mode 100644
> index 0000000..0cd03ef
> --- /dev/null
> +++ b/nouveau/nvif/if0003.h
> @@ -0,0 +1,33 @@
> +#ifndef __NVIF_IF0003_H__
> +#define __NVIF_IF0003_H__
> +
> +struct nvif_perfdom_v0 {
> +	__u8  version;
> +	__u8  domain;
> +	__u8  mode;
> +	__u8  pad03[1];
> +	struct {
> +		__u8  signal[4];
> +		__u64 source[4][8];
> +		__u16 logic_op;
> +	} ctr[4];
> +};
> +
> +#define NVIF_PERFDOM_V0_INIT                                          =
     0x00
> +#define NVIF_PERFDOM_V0_SAMPLE                                        =
     0x01
> +#define NVIF_PERFDOM_V0_READ                                          =
     0x02
> +
> +struct nvif_perfdom_init {
> +};
> +
> +struct nvif_perfdom_sample {
> +};
> +
> +struct nvif_perfdom_read_v0 {
> +	__u8  version;
> +	__u8  pad01[7];
> +	__u32 ctr[4];
> +	__u32 clk;
> +	__u8  pad04[4];
> +};
> +#endif
> diff --git a/nouveau/nvif/ioctl.h b/nouveau/nvif/ioctl.h
> new file mode 100644
> index 0000000..c5f5eb8
> --- /dev/null
> +++ b/nouveau/nvif/ioctl.h
> @@ -0,0 +1,132 @@
> +#ifndef __NVIF_IOCTL_H__
> +#define __NVIF_IOCTL_H__
> +
> +#define NVIF_VERSION_LATEST                               0x0000000000=
000000ULL
> +
> +struct nvif_ioctl_v0 {
> +	__u8  version;
> +#define NVIF_IOCTL_V0_NOP                                             =
     0x00
> +#define NVIF_IOCTL_V0_SCLASS                                          =
     0x01
> +#define NVIF_IOCTL_V0_NEW                                             =
     0x02
> +#define NVIF_IOCTL_V0_DEL                                             =
     0x03
> +#define NVIF_IOCTL_V0_MTHD                                            =
     0x04
> +#define NVIF_IOCTL_V0_RD                                              =
     0x05
> +#define NVIF_IOCTL_V0_WR                                              =
     0x06
> +#define NVIF_IOCTL_V0_MAP                                             =
     0x07
> +#define NVIF_IOCTL_V0_UNMAP                                           =
     0x08
> +#define NVIF_IOCTL_V0_NTFY_NEW                                        =
     0x09
> +#define NVIF_IOCTL_V0_NTFY_DEL                                        =
     0x0a
> +#define NVIF_IOCTL_V0_NTFY_GET                                        =
     0x0b
> +#define NVIF_IOCTL_V0_NTFY_PUT                                        =
     0x0c
> +	__u8  type;
> +	__u8  pad02[4];
> +#define NVIF_IOCTL_V0_OWNER_NVIF                                      =
     0x00
> +#define NVIF_IOCTL_V0_OWNER_ANY                                       =
     0xff
> +	__u8  owner;
> +#define NVIF_IOCTL_V0_ROUTE_NVIF                                      =
     0x00
> +#define NVIF_IOCTL_V0_ROUTE_HIDDEN                                    =
     0xff
> +	__u8  route;
> +	__u64 token;
> +	__u64 object;
> +	__u8  data[];		/* ioctl data (below) */
> +};
> +
> +struct nvif_ioctl_nop_v0 {
> +	__u64 version;
> +};
> +
> +struct nvif_ioctl_sclass_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  count;
> +	__u8  pad02[6];
> +	struct nvif_ioctl_sclass_oclass_v0 {
> +		__s32 oclass;
> +		__s16 minver;
> +		__s16 maxver;
> +	} oclass[];
> +};
> +
> +struct nvif_ioctl_new_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  pad01[6];
> +	__u8  route;
> +	__u64 token;
> +	__u64 object;
> +	__u32 handle;
> +	__s32 oclass;
> +	__u8  data[];		/* class data (class.h) */
> +};
> +
> +struct nvif_ioctl_del {
> +};
> +
> +struct nvif_ioctl_rd_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  size;
> +	__u8  pad02[2];
> +	__u32 data;
> +	__u64 addr;
> +};
> +
> +struct nvif_ioctl_wr_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  size;
> +	__u8  pad02[2];
> +	__u32 data;
> +	__u64 addr;
> +};
> +
> +struct nvif_ioctl_map_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  pad01[3];
> +	__u32 length;
> +	__u64 handle;
> +};
> +
> +struct nvif_ioctl_unmap {
> +};
> +
> +struct nvif_ioctl_ntfy_new_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  event;
> +	__u8  index;
> +	__u8  pad03[5];
> +	__u8  data[];		/* event request data (event.h) */
> +};
> +
> +struct nvif_ioctl_ntfy_del_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  index;
> +	__u8  pad02[6];
> +};
> +
> +struct nvif_ioctl_ntfy_get_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  index;
> +	__u8  pad02[6];
> +};
> +
> +struct nvif_ioctl_ntfy_put_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  index;
> +	__u8  pad02[6];
> +};
> +
> +struct nvif_ioctl_mthd_v0 {
> +	/* nvif_ioctl ... */
> +	__u8  version;
> +	__u8  method;
> +	__u8  pad02[6];
> +	__u8  data[];		/* method data (class.h) */
> +};
> +
> +#endif
> diff --git a/nouveau/nvif/unpack.h b/nouveau/nvif/unpack.h
> new file mode 100644
> index 0000000..751bcf4
> --- /dev/null
> +++ b/nouveau/nvif/unpack.h
> @@ -0,0 +1,28 @@
> +#ifndef __NVIF_UNPACK_H__
> +#define __NVIF_UNPACK_H__
> +
> +#define nvif_unvers(r,d,s,m) ({                                       =
         \
> +	void **_data =3D (d); __u32 *_size =3D (s); int _ret =3D (r);        =
        \
> +	if (_ret =3D=3D -ENOSYS && *_size =3D=3D sizeof(m)) {                =
          \
> +		*_data =3D NULL;                                                 \
> +		*_size =3D _ret =3D 0;                                             \=

> +	}                                                                    =
  \
> +	_ret;                                                                =
  \
> +})
> +
> +#define nvif_unpack(r,d,s,m,vl,vh,x) ({                               =
         \
> +	void **_data =3D (d); __u32 *_size =3D (s);                          =
      \
> +	int _ret =3D (r), _vl =3D (vl), _vh =3D (vh);                        =
        \
> +	if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&                  =
        \
> +	    (m).version >=3D _vl && (m).version <=3D _vh) {                  =
      \
> +		*_data =3D (__u8 *)*_data + sizeof(m);                           \
> +		*_size =3D *_size - sizeof(m);                                   \
> +		if (_ret =3D 0, !(x)) {                                          \
> +			_ret =3D *_size ? -E2BIG : 0;                            \
> +			*_data =3D NULL;                                         \
> +			*_size =3D 0;                                            \
> +		}                                                              \
> +	}                                                                    =
  \
> +	_ret;                                                                =
  \
> +})
> +#endif
>=20


--UjfmQugIAoI1NODH06TSHuMfgvphTB1th
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWcfRjAAoJEHYLnGJQkpH7IV4P/3XU0rP44GE0gvun65X1M8Gn
qJhaZ/fF/5UTWiV02iTcVP7MdOj9tryLlFdrLqe5ZNFWzqpQ7I4hyUpzPvgNmEI/
ItPfX5dXxlkwSyGfemGynASBpKd1OsiYydOb3fcPga4cLZk8kKUDvzK4tkpPGju9
hb1n+aZsbl2djNCFPPOvJc+Yf3GvDazrwwgcRxLqTSM/r7hzEd6bvZkr3Tyu3BRa
rTlo7CPH/jDLdBqslJNgJs0pyTfQg+l6DNN6Okzmn1LIm1os/P3/2wFL0zBGpomY
3QRjShGgppvBAPeITBay0CxFTCu0sNcLrDZD3KdloOSpt9t4AGHwcZTtqB+yuzFU
feeHShoBL87T3SDtSReYVNb0nlhI1Ooo/SL1qQSZ1vF8Rycu5ZSzTimoqygivLSW
W8KPrSSd/wxsDlVBlhVtgPv7uPpNMaYk+VWM5HEtFlDifQgmmaXx1WpUtZX7VsTa
xCdJYwcoMm7mZvMs8udIZhL5zSLYkx2FdOktA1Fb46kCYbUigW5HgMJ7XtlZwFgi
ySUXzi0OaXnhEESjPq0AQMxE3JJ6MTVGF6uoTjkHhys2JL2sgml+3aLBbaPQYLox
XQA4hZ0eGbWhxtwkI4gM+xMQNtPHbINxxsJQie2gkEqLffm+kY4icSrNpl8JjScd
FacIcg8IHAYvPkr9+Iih
=/mX7
-----END PGP SIGNATURE-----

--UjfmQugIAoI1NODH06TSHuMfgvphTB1th--

--===============1180991314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1180991314==--

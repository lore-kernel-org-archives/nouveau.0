From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 7/8] acpi: Add support for Apple Gmux _DMS
Date: Tue, 26 May 2015 10:30:40 +0200
Message-ID: <8B1C0863-7A6F-446D-8878-500C37B082D2@free.fr>
References: <1432592573-13743-1-git-send-email-pierre.morrow@free.fr>
 <1432592573-13743-7-git-send-email-pierre.morrow@free.fr>
 <55642B45.3020509@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/mixed; boundary="===============0817295428=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <55642B45.3020509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0817295428==
Content-Type: multipart/alternative; boundary="Apple-Mail=_261CD07B-F507-40E2-BD12-282865013C75"


--Apple-Mail=_261CD07B-F507-40E2-BD12-282865013C75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 26 May 2015, at 10:13, Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>=20
>=20
>=20
> On 05/26/2015 12:22 AM, Pierre Moreau wrote:
>> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
>> ---
>>  drm/nouveau/nouveau_acpi.c | 53 =
++++++++++++++++++++++++++++++++++++++++++++--
>>  drm/nouveau/nouveau_acpi.h |  2 ++
>>  drm/nouveau/nouveau_drm.c  |  6 ++++--
>>  drm/nouveau/nouveau_vga.c  | 10 +++++----
>>  4 files changed, 63 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drm/nouveau/nouveau_acpi.c b/drm/nouveau/nouveau_acpi.c
>> index 104d291..3d6a1ea 100644
>> --- a/drm/nouveau/nouveau_acpi.c
>> +++ b/drm/nouveau/nouveau_acpi.c
>> @@ -29,6 +29,10 @@
>>    #define NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN =
(NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 | NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED)
>>  +#define NOUVEAU_DSM_GMUX_V1_CAPS (3 << 6)
>> +
>> +#define NOUVEAU_DSM_GMUX_V2_CAPS (1 << 1)
>> +
>>  /* result of the optimus caps function */
>>  #define OPTIMUS_ENABLED (1 << 0)
>>  #define OPTIMUS_STATUS_MASK (3 << 3)
>> @@ -45,6 +49,7 @@
>>  static struct nouveau_dsm_priv {
>>  	bool mux_detected;
>>  	bool optimus_detected;
>> +	bool gmux_detected;
>>  	acpi_handle dhandle;
>>  	acpi_handle rom_handle;
>>  } nouveau_dsm_priv;
>> @@ -57,8 +62,13 @@ bool nouveau_has_mux(void) {
>>  	return nouveau_dsm_priv.mux_detected;
>>  }
>>  +bool nouveau_has_gmux(void) {
>> +	return nouveau_dsm_priv.gmux_detected;
>> +}
>> +
>>  #define NOUVEAU_DSM_HAS_MUX 0x1
>>  #define NOUVEAU_DSM_HAS_OPT 0x2
>> +#define NOUVEAU_DSM_HAS_GMUX 0x4
>>    #ifdef CONFIG_VGA_SWITCHEROO
>>  static const uint32_t nouveau_mux_dsm_rid =3D 0x00000102;
>> @@ -73,6 +83,18 @@ static const char nouveau_op_dsm_muid[] =3D {
>>  	0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0,
>>  };
>>  +static const uint32_t nouveau_gmux_v1_dsm_rid =3D 0x0000101;
>> +static const char nouveau_gmux_v1_dsm_muid[] =3D {
>> +	0xA6, 0x69, 0x86, 0x99, 0xE9, 0x8B, 0xFB, 0x49,
>> +	0xBD, 0xDB, 0x51, 0xA1, 0xEF, 0xE1, 0x9C, 0x3D,
>> +};
>> +
>> +static const uint32_t nouveau_gmux_v2_dsm_rid =3D 0x0000001;
>> +static const char nouveau_gmux_v2_dsm_muid[] =3D {
>> +	0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44,
>> +	0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B,
>> +};
>> +
>>  static int nouveau_evaluate_optimus_dsm(acpi_handle handle, int =
func, int arg, uint32_t *result)
>>  {
>>  	int i;
>> @@ -161,6 +183,17 @@ static int nouveau_evaluate_mux_dsm(acpi_handle =
handle, int func, int arg)
>>  	return ret;
>>  }
>>  +static int nouveau_check_gmux_dsm(acpi_handle handle)
>> +{
>> +	bool has_v1 =3D acpi_check_dsm(handle, nouveau_gmux_v1_dsm_muid,
>> +			             nouveau_gmux_v1_dsm_rid,
>> +			             NOUVEAU_DSM_GMUX_V1_CAPS);
>> +	bool has_v2 =3D acpi_check_dsm(handle, nouveau_gmux_v2_dsm_muid,
>> +			             nouveau_gmux_v2_dsm_rid,
>> +			             NOUVEAU_DSM_GMUX_V2_CAPS);
>> +	return has_v1 || has_v2;
>> +}
>> +
>>  static int nouveau_dsm_switch_mux(acpi_handle handle, int mux_id)
>>  {
>>  	mxm_wmi_call_mxmx(mux_id =3D=3D NOUVEAU_DSM_MUX_LED_STAMINA ? =
MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
>> @@ -238,6 +271,9 @@ static int nouveau_dsm_pci_probe(struct pci_dev =
*pdev)
>>  			   1 << NOUVEAU_DSM_MUX_POWER))
>>  		retval |=3D NOUVEAU_DSM_HAS_MUX;
>>  +	if (nouveau_check_gmux_dsm(dhandle))
>> +		retval |=3D NOUVEAU_DSM_HAS_GMUX;
>> +
>>  	if (nouveau_check_optimus_dsm(dhandle))
>>  		retval |=3D NOUVEAU_DSM_HAS_OPT;
>>  @@ -263,6 +299,7 @@ static bool nouveau_dsm_detect(void)
>>  	struct pci_dev *pdev =3D NULL;
>>  	int has_dsm =3D 0;
>>  	int has_optimus =3D 0;
>> +	bool has_gmux =3D false;
>>  	int vga_count =3D 0;
>>  	bool guid_valid;
>>  	int retval;
>> @@ -283,6 +320,8 @@ static bool nouveau_dsm_detect(void)
>>  			has_dsm |=3D 1;
>>  		if (retval & NOUVEAU_DSM_HAS_OPT)
>>  			has_optimus =3D 1;
>> +		if (retval & NOUVEAU_DSM_HAS_GMUX)
>> +			has_gmux =3D true;
>>  	}
>>    	while ((pdev =3D pci_get_class(PCI_CLASS_DISPLAY_3D << 8, pdev)) =
!=3D NULL) {
>> @@ -293,9 +332,11 @@ static bool nouveau_dsm_detect(void)
>>  			has_dsm |=3D 1;
>>  		if (retval & NOUVEAU_DSM_HAS_OPT)
>>  			has_optimus =3D 1;
>> +		if (retval & NOUVEAU_DSM_HAS_GMUX)
>> +			has_gmux =3D true;
>>  	}
>>  -	/* find the optimus DSM or the mux DSM */
>> +	/* find the optimus DSM, the mux DSM or the gmux DSM */
>>  	if (has_optimus =3D=3D 1) {
>>  		acpi_get_name(nouveau_dsm_priv.dhandle, =
ACPI_FULL_PATHNAME,
>>  			&buffer);
>> @@ -310,6 +351,13 @@ static bool nouveau_dsm_detect(void)
>>  			acpi_method_name);
>>  		nouveau_dsm_priv.mux_detected =3D true;
>>  		ret =3D true;
>> +	} else if (has_gmux) {
>> +		acpi_get_name(nouveau_dsm_priv.dhandle, =
ACPI_FULL_PATHNAME,
>> +			&buffer);
>> +		printk(KERN_INFO "VGA switcheroo: detected gmux DSM =
switching method %s handle\n",
>> +			acpi_method_name);
>> +		nouveau_dsm_priv.gmux_detected =3D true;
>> +		ret =3D true;
>>  	}
>>    @@ -321,7 +369,8 @@ void nouveau_register_dsm_handler(void)
>>  	bool r;
>>    	r =3D nouveau_dsm_detect();
>> -	if (!r)
>> +	/* Apple Gmux will register its own vga switcheroo handler */
>> +	if (!r || nouveau_has_gmux())
>>  		return;
>>    	vga_switcheroo_register_handler(&nouveau_dsm_handler);
>> diff --git a/drm/nouveau/nouveau_acpi.h b/drm/nouveau/nouveau_acpi.h
>> index 2bd88a8..7fcfe82 100644
>> --- a/drm/nouveau/nouveau_acpi.h
>> +++ b/drm/nouveau/nouveau_acpi.h
>> @@ -6,6 +6,7 @@
>>  #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
>>  bool nouveau_is_optimus(void);
>>  bool nouveau_has_mux(void);
>> +bool nouveau_has_gmux(void);
>>  void nouveau_register_dsm_handler(void);
>>  void nouveau_unregister_dsm_handler(void);
>>  void nouveau_switcheroo_optimus_dsm(void);
>> @@ -15,6 +16,7 @@ void *nouveau_acpi_edid(struct drm_device *, struct =
drm_connector *);
>>  #else
>>  static inline bool nouveau_is_optimus(void) { return false; };
>>  static inline bool nouveau_has_mux(void) { return false; };
>> +static inline bool nouveau_has_gmux(void) { return false; };
>>  static inline void nouveau_register_dsm_handler(void) {}
>>  static inline void nouveau_unregister_dsm_handler(void) {}
>>  static inline void nouveau_switcheroo_optimus_dsm(void) {}
>> diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
>> index c06a7a1..702aff8 100644
>> --- a/drm/nouveau/nouveau_drm.c
>> +++ b/drm/nouveau/nouveau_drm.c
>> @@ -719,7 +719,8 @@ nouveau_pmops_runtime_suspend(struct device *dev)
>>  	}
>>    	/* are we optimus enabled? */
>> -	if (nouveau_runtime_pm =3D=3D -1 && !nouveau_is_optimus() && =
!nouveau_has_mux()) {
>> +	if (nouveau_runtime_pm =3D=3D -1 &&
>> +	    !nouveau_is_optimus() && !nouveau_has_mux() && =
!nouveau_has_gmux()) {
>>  		DRM_DEBUG_DRIVER("failing to power off - not =
optimus\n");
>>  		pm_runtime_forbid(dev);
>>  		return -EBUSY;
>> @@ -780,7 +781,8 @@ nouveau_pmops_runtime_idle(struct device *dev)
>>  	}
>>    	/* are we optimus enabled? */
>> -	if (nouveau_runtime_pm =3D=3D -1 && !nouveau_is_optimus() && =
!nouveau_has_mux()) {
>> +	if (nouveau_runtime_pm =3D=3D -1 &&
>> +	    !nouveau_is_optimus() && !nouveau_has_mux() && =
!nouveau_has_gmux()) {
>>  		DRM_DEBUG_DRIVER("failing to power off - not =
optimus\n");
>>  		pm_runtime_forbid(dev);
>>  		return -EBUSY;
>> diff --git a/drm/nouveau/nouveau_vga.c b/drm/nouveau/nouveau_vga.c
>> index 9a6328f..3a7a9b9 100644
>> --- a/drm/nouveau/nouveau_vga.c
>> +++ b/drm/nouveau/nouveau_vga.c
>> @@ -96,11 +96,12 @@ nouveau_vga_init(struct nouveau_drm *drm)
>>    	if (nouveau_runtime_pm =3D=3D 1)
>>  		runtime =3D true;
>> -	if ((nouveau_runtime_pm =3D=3D -1) && (nouveau_is_optimus() || =
nouveau_has_mux()))
>> +	if ((nouveau_runtime_pm =3D=3D -1) &&
>> +	    (nouveau_is_optimus() || nouveau_has_mux() || =
nouveau_has_gmux()))
>>  		runtime =3D true;
>>  	vga_switcheroo_register_client(dev->pdev, =
&nouveau_switcheroo_ops, runtime);
>>  -	if (runtime && nouveau_has_mux() && !nouveau_is_optimus())
>> +	if (runtime && (nouveau_has_mux() || nouveau_has_gmux()) && =
!nouveau_is_optimus())
>>  		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, =
&drm->vga_pm_domain);
>>  }
>>  @@ -112,11 +113,12 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>>    	if (nouveau_runtime_pm =3D=3D 1)
>>  		runtime =3D true;
>> -	if ((nouveau_runtime_pm =3D=3D -1) && (nouveau_is_optimus() || =
nouveau_has_mux()))
>> +	if ((nouveau_runtime_pm =3D=3D -1) &&
>> +	    (nouveau_is_optimus() || nouveau_has_mux() || =
nouveau_has_gmux()))
>>  		runtime =3D true;
>> =20
>=20
> You could maybe factorize a bit here by adding nouveau_has_optimus(). =
What do you think?

I was thinking of something like that, but I wasn=E2=80=99t sure about =
the name. Using optimus seems tricky, because you could have =
nouveau_is_optimus(): false but nouveau_has_optimus(): true=E2=80=A6

>=20
>>  	vga_switcheroo_unregister_client(dev->pdev);
>> -	if (runtime && nouveau_has_mux() && !nouveau_is_optimus())
>> +	if (runtime && (nouveau_has_mux() || nouveau_has_gmux()) && =
!nouveau_is_optimus())
>>  		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>>  	vga_client_register(dev->pdev, NULL, NULL, NULL);
>>  }


--Apple-Mail=_261CD07B-F507-40E2-BD12-282865013C75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 26 May 2015, at 10:13, Samuel Pitoiset &lt;<a =
href=3D"mailto:samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
class=3D"">samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On 05/26/2015 12:22 AM, Pierre Moreau =
wrote:</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">Signed-off-by: Pierre Moreau &lt;<a =
href=3D"mailto:pierre.morrow-GANU6spQydw@public.gmane.org" =
class=3D"">pierre.morrow-GANU6spQydw@public.gmane.org</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;drm/nouveau/nouveau_acpi.c | 53 =
++++++++++++++++++++++++++++++++++++++++++++--<br =
class=3D"">&nbsp;drm/nouveau/nouveau_acpi.h | &nbsp;2 ++<br =
class=3D"">&nbsp;drm/nouveau/nouveau_drm.c &nbsp;| &nbsp;6 ++++--<br =
class=3D"">&nbsp;drm/nouveau/nouveau_vga.c &nbsp;| 10 +++++----<br =
class=3D"">&nbsp;4 files changed, 63 insertions(+), 8 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/drm/nouveau/nouveau_acpi.c =
b/drm/nouveau/nouveau_acpi.c<br class=3D"">index 104d291..3d6a1ea =
100644<br class=3D"">--- a/drm/nouveau/nouveau_acpi.c<br class=3D"">+++ =
b/drm/nouveau/nouveau_acpi.c<br class=3D"">@@ -29,6 +29,10 @@<br =
class=3D"">&nbsp;&nbsp;&nbsp;#define NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN =
(NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 | =
NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED)<br class=3D"">&nbsp;+#define =
NOUVEAU_DSM_GMUX_V1_CAPS (3 &lt;&lt; 6)<br class=3D"">+<br =
class=3D"">+#define NOUVEAU_DSM_GMUX_V2_CAPS (1 &lt;&lt; 1)<br =
class=3D"">+<br class=3D"">&nbsp;/* result of the optimus caps function =
*/<br class=3D"">&nbsp;#define OPTIMUS_ENABLED (1 &lt;&lt; 0)<br =
class=3D"">&nbsp;#define OPTIMUS_STATUS_MASK (3 &lt;&lt; 3)<br =
class=3D"">@@ -45,6 +49,7 @@<br class=3D"">&nbsp;static struct =
nouveau_dsm_priv {<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bool mux_detected;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>bool optimus_detected;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
gmux_detected;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>acpi_handle dhandle;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>acpi_handle rom_handle;<br class=3D"">&nbsp;} =
nouveau_dsm_priv;<br class=3D"">@@ -57,8 +62,13 @@ bool =
nouveau_has_mux(void) {<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>return =
nouveau_dsm_priv.mux_detected;<br class=3D"">&nbsp;}<br =
class=3D"">&nbsp;+bool nouveau_has_gmux(void) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
nouveau_dsm_priv.gmux_detected;<br class=3D"">+}<br class=3D"">+<br =
class=3D"">&nbsp;#define NOUVEAU_DSM_HAS_MUX 0x1<br =
class=3D"">&nbsp;#define NOUVEAU_DSM_HAS_OPT 0x2<br class=3D"">+#define =
NOUVEAU_DSM_HAS_GMUX 0x4<br class=3D"">&nbsp;&nbsp;&nbsp;#ifdef =
CONFIG_VGA_SWITCHEROO<br class=3D"">&nbsp;static const uint32_t =
nouveau_mux_dsm_rid =3D 0x00000102;<br class=3D"">@@ -73,6 +83,18 @@ =
static const char nouveau_op_dsm_muid[] =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>0xA7, =
0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0,<br class=3D"">&nbsp;};<br =
class=3D"">&nbsp;+static const uint32_t nouveau_gmux_v1_dsm_rid =3D =
0x0000101;<br class=3D"">+static const char nouveau_gmux_v1_dsm_muid[] =3D=
 {<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>0xA6, 0x69, 0x86, 0x99, 0xE9, 0x8B, 0xFB, 0x49,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>0xBD, 0xDB, 0x51, 0xA1, 0xEF, 0xE1, 0x9C, 0x3D,<br =
class=3D"">+};<br class=3D"">+<br class=3D"">+static const uint32_t =
nouveau_gmux_v2_dsm_rid =3D 0x0000001;<br class=3D"">+static const char =
nouveau_gmux_v2_dsm_muid[] =3D {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>0xC6, =
0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>0xB0, =
0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B,<br class=3D"">+};<br =
class=3D"">+<br class=3D"">&nbsp;static int =
nouveau_evaluate_optimus_dsm(acpi_handle handle, int func, int arg, =
uint32_t *result)<br class=3D"">&nbsp;{<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int i;<br =
class=3D"">@@ -161,6 +183,17 @@ static int =
nouveau_evaluate_mux_dsm(acpi_handle handle, int func, int arg)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return ret;<br class=3D"">&nbsp;}<br =
class=3D"">&nbsp;+static int nouveau_check_gmux_dsm(acpi_handle =
handle)<br class=3D"">+{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bool has_v1 =3D =
acpi_check_dsm(handle, nouveau_gmux_v1_dsm_muid,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_gmux_v1_dsm_rid,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOUVEAU_DSM_GMUX_V1_CAPS);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>bool has_v2 =3D acpi_check_dsm(handle, =
nouveau_gmux_v2_dsm_muid,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_gmux_v2_dsm_rid,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOUVEAU_DSM_GMUX_V2_CAPS);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return has_v1 || has_v2;<br class=3D"">+}<br class=3D"">+<br =
class=3D"">&nbsp;static int nouveau_dsm_switch_mux(acpi_handle handle, =
int mux_id)<br class=3D"">&nbsp;{<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mxm_wmi_call_mxmx(mux_id =3D=3D NOUVEAU_DSM_MUX_LED_STAMINA ? =
MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);<br class=3D"">@@ -238,6 =
+271,9 @@ static int nouveau_dsm_pci_probe(struct pci_dev *pdev)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;1 &lt;&lt; =
NOUVEAU_DSM_MUX_POWER))<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>retval |=3D =
NOUVEAU_DSM_HAS_MUX;<br class=3D"">&nbsp;+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(nouveau_check_gmux_dsm(dhandle))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>retval |=3D=
 NOUVEAU_DSM_HAS_GMUX;<br class=3D"">+<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(nouveau_check_optimus_dsm(dhandle))<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>retval |=3D=
 NOUVEAU_DSM_HAS_OPT;<br class=3D"">&nbsp;@@ -263,6 +299,7 @@ static =
bool nouveau_dsm_detect(void)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
pci_dev *pdev =3D NULL;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>int has_dsm =3D 0;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int has_optimus =3D 0;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
has_gmux =3D false;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int vga_count =3D 0;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>bool guid_valid;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int =
retval;<br class=3D"">@@ -283,6 +320,8 @@ static bool =
nouveau_dsm_detect(void)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>has_dsm =
|=3D 1;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (retval &amp; =
NOUVEAU_DSM_HAS_OPT)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>has_optimus =3D 1;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (retval &amp; NOUVEAU_DSM_HAS_GMUX)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>has_gmux =
=3D true;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>while ((pdev =3D =
pci_get_class(PCI_CLASS_DISPLAY_3D &lt;&lt; 8, pdev)) !=3D NULL) {<br =
class=3D"">@@ -293,9 +332,11 @@ static bool nouveau_dsm_detect(void)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>has_dsm |=3D 1;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(retval &amp; NOUVEAU_DSM_HAS_OPT)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>has_optimus =3D 1;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (retval &amp; =
NOUVEAU_DSM_HAS_GMUX)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>has_gmux =3D true;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>}<br class=3D"">&nbsp;-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* find the optimus DSM or the =
mux DSM */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* find the optimus DSM, the mux =
DSM or the gmux DSM */<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (has_optimus =3D=3D 1) {<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>acpi_get_name(nouveau_dsm_priv.dhandle, =
ACPI_FULL_PATHNAME,<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>&amp;buffer);<br class=3D"">@@ =
-310,6 +351,13 @@ static bool nouveau_dsm_detect(void)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>acpi_method_name);<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>nouveau_dsm_priv.mux_detected =3D true;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ret =3D =
true;<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>} else if (has_gmux) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>&amp;buffer);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>printk(KERN_INFO "VGA switcheroo: =
detected gmux DSM switching method %s handle\n",<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>acpi_method_name);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>nouveau_dsm_priv.gmux_detected =3D =
true;<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>ret =3D true;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">&nbsp;&nbsp;&nbsp;@@ -321,7 +369,8 @@ void =
nouveau_register_dsm_handler(void)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
r;<br class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D nouveau_dsm_detect();<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (!r)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Apple Gmux will register its =
own vga switcheroo handler */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (!r || =
nouveau_has_gmux())<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return;<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>vga_switcheroo_register_handler(&amp;nouveau_dsm_handler);<br =
class=3D"">diff --git a/drm/nouveau/nouveau_acpi.h =
b/drm/nouveau/nouveau_acpi.h<br class=3D"">index 2bd88a8..7fcfe82 =
100644<br class=3D"">--- a/drm/nouveau/nouveau_acpi.h<br class=3D"">+++ =
b/drm/nouveau/nouveau_acpi.h<br class=3D"">@@ -6,6 +6,7 @@<br =
class=3D"">&nbsp;#if defined(CONFIG_ACPI) &amp;&amp; =
defined(CONFIG_X86)<br class=3D"">&nbsp;bool =
nouveau_is_optimus(void);<br class=3D"">&nbsp;bool =
nouveau_has_mux(void);<br class=3D"">+bool nouveau_has_gmux(void);<br =
class=3D"">&nbsp;void nouveau_register_dsm_handler(void);<br =
class=3D"">&nbsp;void nouveau_unregister_dsm_handler(void);<br =
class=3D"">&nbsp;void nouveau_switcheroo_optimus_dsm(void);<br =
class=3D"">@@ -15,6 +16,7 @@ void *nouveau_acpi_edid(struct drm_device =
*, struct drm_connector *);<br class=3D"">&nbsp;#else<br =
class=3D"">&nbsp;static inline bool nouveau_is_optimus(void) { return =
false; };<br class=3D"">&nbsp;static inline bool nouveau_has_mux(void) { =
return false; };<br class=3D"">+static inline bool =
nouveau_has_gmux(void) { return false; };<br class=3D"">&nbsp;static =
inline void nouveau_register_dsm_handler(void) {}<br =
class=3D"">&nbsp;static inline void nouveau_unregister_dsm_handler(void) =
{}<br class=3D"">&nbsp;static inline void =
nouveau_switcheroo_optimus_dsm(void) {}<br class=3D"">diff --git =
a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c<br =
class=3D"">index c06a7a1..702aff8 100644<br class=3D"">--- =
a/drm/nouveau/nouveau_drm.c<br class=3D"">+++ =
b/drm/nouveau/nouveau_drm.c<br class=3D"">@@ -719,7 +719,8 @@ =
nouveau_pmops_runtime_suspend(struct device *dev)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>}<br class=3D"">&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* are we =
optimus enabled? */<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (nouveau_runtime_pm =3D=3D -1 =
&amp;&amp; !nouveau_is_optimus() &amp;&amp; !nouveau_has_mux()) {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (nouveau_runtime_pm =3D=3D -1 &amp;&amp;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;!nouveau_is=
_optimus() &amp;&amp; !nouveau_has_mux() &amp;&amp; !nouveau_has_gmux()) =
{<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>DRM_DEBUG_DRIVER("failing to power off - not =
optimus\n");<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pm_runtime_forbid(dev);<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return -EBUSY;<br class=3D"">@@ -780,7 +781,8 @@ =
nouveau_pmops_runtime_idle(struct device *dev)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* are we optimus enabled? */<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (nouveau_runtime_pm =3D=3D -1 &amp;&amp; !nouveau_is_optimus() =
&amp;&amp; !nouveau_has_mux()) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(nouveau_runtime_pm =3D=3D -1 &amp;&amp;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;!nouveau_is=
_optimus() &amp;&amp; !nouveau_has_mux() &amp;&amp; !nouveau_has_gmux()) =
{<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>DRM_DEBUG_DRIVER("failing to power off - not =
optimus\n");<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pm_runtime_forbid(dev);<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return -EBUSY;<br class=3D"">diff --git =
a/drm/nouveau/nouveau_vga.c b/drm/nouveau/nouveau_vga.c<br =
class=3D"">index 9a6328f..3a7a9b9 100644<br class=3D"">--- =
a/drm/nouveau/nouveau_vga.c<br class=3D"">+++ =
b/drm/nouveau/nouveau_vga.c<br class=3D"">@@ -96,11 +96,12 @@ =
nouveau_vga_init(struct nouveau_drm *drm)<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (nouveau_runtime_pm =3D=3D =
1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>runtime =3D true;<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if ((nouveau_runtime_pm =3D=3D -1) &amp;&amp; =
(nouveau_is_optimus() || nouveau_has_mux()))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
((nouveau_runtime_pm =3D=3D -1) &amp;&amp;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;(nouveau_is=
_optimus() || nouveau_has_mux() || nouveau_has_gmux()))<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>runtime =3D true;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>vga_switcheroo_register_client(dev-&gt;pdev, =
&amp;nouveau_switcheroo_ops, runtime);<br class=3D"">&nbsp;-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(runtime &amp;&amp; nouveau_has_mux() &amp;&amp; =
!nouveau_is_optimus())<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (runtime &amp;&amp; =
(nouveau_has_mux() || nouveau_has_gmux()) &amp;&amp; =
!nouveau_is_optimus())<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>vga_switcheroo_init_domain_pm_ops(drm-&gt;dev-&gt;dev, =
&amp;drm-&gt;vga_pm_domain);<br class=3D"">&nbsp;}<br class=3D"">&nbsp;@@ =
-112,11 +113,12 @@ nouveau_vga_fini(struct nouveau_drm *drm)<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (nouveau_runtime_pm =3D=3D =
1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>runtime =3D true;<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if ((nouveau_runtime_pm =3D=3D -1) &amp;&amp; =
(nouveau_is_optimus() || nouveau_has_mux()))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
((nouveau_runtime_pm =3D=3D -1) &amp;&amp;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;(nouveau_is=
_optimus() || nouveau_has_mux() || nouveau_has_gmux()))<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>runtime =3D true;<br class=3D"">&nbsp;<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">You could maybe factorize =
a bit here by adding nouveau_has_optimus(). What do you think?</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>I was =
thinking of something like that, but I wasn=E2=80=99t sure about the =
name. Using optimus seems tricky, because you could have =
nouveau_is_optimus(): false but nouveau_has_optimus(): true=E2=80=A6</div>=
<br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>vga_switcheroo_unregister_client(dev-&gt;pdev);<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (runtime &amp;&amp; nouveau_has_mux() &amp;&amp; =
!nouveau_is_optimus())<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (runtime &amp;&amp; =
(nouveau_has_mux() || nouveau_has_gmux()) &amp;&amp; =
!nouveau_is_optimus())<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>vga_switcheroo_fini_domain_pm_ops(drm-&gt;dev-&gt;dev);<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>vga_client_register(dev-&gt;pdev, NULL, NULL, NULL);<br =
class=3D"">&nbsp;}</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_261CD07B-F507-40E2-BD12-282865013C75--

--===============0817295428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0817295428==--

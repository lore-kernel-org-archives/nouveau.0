From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH 4/8] acpi: Allow evaluate_optimus_dsm to take
 NULL results
Date: Tue, 26 May 2015 10:27:45 +0200
Message-ID: <1353DB34-8F6D-4AC9-BC04-C955A0BEB66A@free.fr>
References: <1432592573-13743-1-git-send-email-pierre.morrow@free.fr>
 <1432592573-13743-4-git-send-email-pierre.morrow@free.fr>
 <5564287C.6030209@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/mixed; boundary="===============1055282898=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5564287C.6030209@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Samuel Pitoiset <samuel.pitoiset@gmail.com>
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============1055282898==
Content-Type: multipart/alternative; boundary="Apple-Mail=_5EE5FD56-00C4-47F7-8619-CAFF2B2585CF"


--Apple-Mail=_5EE5FD56-00C4-47F7-8619-CAFF2B2585CF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 26 May 2015, at 10:02, Samuel Pitoiset <samuel.pitoiset@gmail.com> =
wrote:
>=20
>=20
>=20
> On 05/26/2015 12:22 AM, Pierre Moreau wrote:
>> Signed-off-by: Pierre Moreau <pierre.morrow@free.fr>
>> ---
>>  drm/nouveau/nouveau_acpi.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drm/nouveau/nouveau_acpi.c b/drm/nouveau/nouveau_acpi.c
>> index 36f4a40..073f7d7 100644
>> --- a/drm/nouveau/nouveau_acpi.c
>> +++ b/drm/nouveau/nouveau_acpi.c
>> @@ -88,15 +88,14 @@ static int =
nouveau_evaluate_optimus_dsm(acpi_handle handle, int func, int arg, u
>>  	for (i =3D 0; i < 4; i++)
>>  		args_buff[i] =3D (arg >> i * 8) & 0xFF;
>>  -	*result =3D 0;
>>  	obj =3D acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid, =
nouveau_op_dsm_rid,
>>  				      func, &argv4, ACPI_TYPE_BUFFER);
>>  	if (!obj) {
>>  		acpi_handle_info(handle, "failed to evaluate _DSM\n");
>>  		return AE_ERROR;
>>  	} else {
>> -		if (obj->buffer.length =3D=3D 4) {
>> -			*result |=3D obj->buffer.pointer[0];
>> +		if (!result && obj->buffer.length =3D=3D 4) {
>> +			*result  =3D obj->buffer.pointer[0];
>=20
> segfault here if result is NULL! ;)

Good catch!

>=20
>>  			*result |=3D (obj->buffer.pointer[1] << 8);
>>  			*result |=3D (obj->buffer.pointer[2] << 16);
>>  			*result |=3D (obj->buffer.pointer[3] << 24);
>> @@ -322,18 +321,17 @@ void nouveau_register_dsm_handler(void)
>>  /* Must be called for Optimus models before the card can be turned =
off */
>>  void nouveau_switcheroo_optimus_dsm(void)
>>  {
>> -	u32 result =3D 0;
>>  	if (!nouveau_dsm_priv.optimus_detected)
>>  		return;
>>    	nouveau_evaluate_optimus_dsm(nouveau_dsm_priv.dhandle,
>>  			             NOUVEAU_DSM_OPTIMUS_FLAGS,
>> -			             0x3, &result);
>> +			             0x3, NULL);
>>    	nouveau_evaluate_optimus_dsm(nouveau_dsm_priv.dhandle,
>>  			             NOUVEAU_DSM_OPTIMUS_CAPS,
>>  			             NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN,
>> -			             &result);
>> +			             NULL);
>>    }


--Apple-Mail=_5EE5FD56-00C4-47F7-8619-CAFF2B2585CF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 26 May 2015, at 10:02, Samuel Pitoiset &lt;<a =
href=3D"mailto:samuel.pitoiset@gmail.com" =
class=3D"">samuel.pitoiset@gmail.com</a>&gt; wrote:</div><br =
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
href=3D"mailto:pierre.morrow@free.fr" =
class=3D"">pierre.morrow@free.fr</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;drm/nouveau/nouveau_acpi.c | 10 ++++------<br =
class=3D"">&nbsp;1 file changed, 4 insertions(+), 6 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/drm/nouveau/nouveau_acpi.c =
b/drm/nouveau/nouveau_acpi.c<br class=3D"">index 36f4a40..073f7d7 =
100644<br class=3D"">--- a/drm/nouveau/nouveau_acpi.c<br class=3D"">+++ =
b/drm/nouveau/nouveau_acpi.c<br class=3D"">@@ -88,15 +88,14 @@ static =
int nouveau_evaluate_optimus_dsm(acpi_handle handle, int func, int arg, =
u<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>for (i =3D 0; i &lt; 4; i++)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>args_buff[i] =3D (arg &gt;&gt; i * 8) &amp; 0xFF;<br =
class=3D"">&nbsp;-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>*result =3D 0;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>obj =3D =
acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid, =
nouveau_op_dsm_rid,<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;func, &amp;argv4, ACPI_TYPE_BUFFER);<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (!obj) =
{<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>acpi_handle_info(handle, "failed to evaluate _DSM\n");<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return AE_ERROR;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>} else =
{<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (obj-&gt;buffer.length =3D=3D 4) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>*result =
|=3D obj-&gt;buffer.pointer[0];<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!result &amp;&amp; obj-&gt;buffer.length =3D=3D 4) {<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>*result =
&nbsp;=3D obj-&gt;buffer.pointer[0];<br class=3D""></blockquote><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">segfault here if result is NULL! ;)</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Good =
catch!</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>*result |=3D =
(obj-&gt;buffer.pointer[1] &lt;&lt; 8);<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>*result =
|=3D (obj-&gt;buffer.pointer[2] &lt;&lt; 16);<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>*result =
|=3D (obj-&gt;buffer.pointer[3] &lt;&lt; 24);<br class=3D"">@@ -322,18 =
+321,17 @@ void nouveau_register_dsm_handler(void)<br class=3D"">&nbsp;/* =
Must be called for Optimus models before the card can be turned off =
*/<br class=3D"">&nbsp;void nouveau_switcheroo_optimus_dsm(void)<br =
class=3D"">&nbsp;{<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u32 result =3D 0;<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (!nouveau_dsm_priv.optimus_detected)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return;<br class=3D"">&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>nouveau_evaluate_optimus_dsm(nouveau_dsm_priv.dhandle,<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOUVEAU_DSM_OPTIMUS_FLAGS,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x3, &amp;result);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x3, NULL);<br =
class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>nouveau_evaluate_optimus_dsm(nouveau_dsm_priv.dhandle,<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOUVEAU_DSM_OPTIMUS_CAPS,<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOUVEAU_DSM_OPTIMUS_SET_POWERDO=
WN,<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;result);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL);<br =
class=3D"">&nbsp;&nbsp;&nbsp;}</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_5EE5FD56-00C4-47F7-8619-CAFF2B2585CF--

--===============1055282898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1055282898==--

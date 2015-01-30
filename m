From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Fri, 30 Jan 2015 09:30:48 +0000
Message-ID: <bug-88868-8800-wlh4EN8CoD@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1987343086=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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
List-Id: nouveau.vger.kernel.org


--===============1987343086==
Content-Type: multipart/alternative; boundary="1422610247.3e8dDD1.22999"; charset="UTF-8"


--1422610247.3e8dDD1.22999
Date: Fri, 30 Jan 2015 09:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D88868

--- Comment #14 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Dmitriy from comment #12)
> Created attachment 112968 [details]
> Gt610_log_patch
>=20
> Thank you.
>=20
> magic patch.
> "boot" value is now correct.
> What this command "ioread32_native(map);"  do ?
It does a read of mmio space to make sure the previous write has fully taken
effect.

> but kernel anyway crash on operation read 0x700000.
>=20
> Value bar0 and value from addr.0x619f04 is not correct read. It is show in
> debug in file bios/base.c
You still need to use a newer kernel.  Later kernels have code to detect th=
at
there's no VBIOS area setup in VRAM before trying to access it.

What's likely happening is your board hasn't been POSTed (likely, because
you're not on x86 to have the vbios set stuff up for you), and using the
uninitialised memory controllers is making the card very unhappy.

Ben.

>=20
> file base.c
> 		/* switch mmio to cpu's native endianness */
> #ifndef __BIG_ENDIAN
> 		if (ioread32_native(map + 0x000004) !=3D 0x00000000){
> #else
> 		if (ioread32_native(map + 0x000004) =3D=3D 0x00000000){
> #endif
> 			iowrite32_native(0x01000001, map + 0x000004);
> 			ioread32_native(map);
> 		}
>=20
> 		/* read boot0 and strapping information */
> 		boot0 =3D ioread32_native(map + 0x000000);
> 		strap =3D ioread32_native(map + 0x101000);
>=20
> 		printk ("##boot0=3D%x\n",boot0);
> 		printk ("##strap=3D%x\n",strap);
>=20
> file bios/base.c
> 	unsigned int tmp_val;
>=20
> 	if (device->card_type >=3D NV_50) {
> 		u64 addr =3D (u64)(nv_rd32(bios, 0x619f04) & 0xffffff00) << 8;
> 		if (!addr) {
> 			addr  =3D (u64)nv_rd32(bios, 0x001700) << 16;
> 			addr +=3D 0xf0000;
> 		}
>=20
> 		bar0 =3D nv_mask(bios, 0x001700, 0xffffffff, addr >> 16);
> 		printk ("##%s(%d) bar0=3D%x\n",__FUNCTION__,__LINE__,bar0);
> 	}
>=20
> 	tmp_val =3D nv_rd32(bios, 0x619f04);
> 	printk ("##val=3D%x\n", tmp_val);

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1422610247.3e8dDD1.22999
Date: Fri, 30 Jan 2015 09:30:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88868#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88868">bug 88868<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href=3D"show_bug.cgi?id=3D88868#c=
12">comment #12</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D112968" name=3D"attach_112968" title=3D"Gt610_log_patch">attachment=
 112968</a> <a href=3D"attachment.cgi?id=3D112968&amp;action=3Dedit" title=
=3D"Gt610_log_patch">[details]</a></span>
&gt; Gt610_log_patch
&gt;=20
&gt; Thank you.
&gt;=20
&gt; magic patch.
&gt; &quot;boot&quot; value is now correct.
&gt; What this command &quot;ioread32_native(map);&quot;  do ?</span >
It does a read of mmio space to make sure the previous write has fully taken
effect.

<span class=3D"quote">&gt; but kernel anyway crash on operation read 0x7000=
00.
&gt;=20
&gt; Value bar0 and value from addr.0x619f04 is not correct read. It is sho=
w in
&gt; debug in file bios/base.c</span >
You still need to use a newer kernel.  Later kernels have code to detect th=
at
there's no VBIOS area setup in VRAM before trying to access it.

What's likely happening is your board hasn't been POSTed (likely, because
you're not on x86 to have the vbios set stuff up for you), and using the
uninitialised memory controllers is making the card very unhappy.

Ben.

<span class=3D"quote">&gt;=20
&gt; file base.c
&gt; 		/* switch mmio to cpu's native endianness */
&gt; #ifndef __BIG_ENDIAN
&gt; 		if (ioread32_native(map + 0x000004) !=3D 0x00000000){
&gt; #else
&gt; 		if (ioread32_native(map + 0x000004) =3D=3D 0x00000000){
&gt; #endif
&gt; 			iowrite32_native(0x01000001, map + 0x000004);
&gt; 			ioread32_native(map);
&gt; 		}
&gt;=20
&gt; 		/* read boot0 and strapping information */
&gt; 		boot0 =3D ioread32_native(map + 0x000000);
&gt; 		strap =3D ioread32_native(map + 0x101000);
&gt;=20
&gt; 		printk (&quot;##boot0=3D%x\n&quot;,boot0);
&gt; 		printk (&quot;##strap=3D%x\n&quot;,strap);
&gt;=20
&gt; file bios/base.c
&gt; 	unsigned int tmp_val;
&gt;=20
&gt; 	if (device-&gt;card_type &gt;=3D NV_50) {
&gt; 		u64 addr =3D (u64)(nv_rd32(bios, 0x619f04) &amp; 0xffffff00) &lt;&lt=
; 8;
&gt; 		if (!addr) {
&gt; 			addr  =3D (u64)nv_rd32(bios, 0x001700) &lt;&lt; 16;
&gt; 			addr +=3D 0xf0000;
&gt; 		}
&gt;=20
&gt; 		bar0 =3D nv_mask(bios, 0x001700, 0xffffffff, addr &gt;&gt; 16);
&gt; 		printk (&quot;##%s(%d) bar0=3D%x\n&quot;,__FUNCTION__,__LINE__,bar0);
&gt; 	}
&gt;=20
&gt; 	tmp_val =3D nv_rd32(bios, 0x619f04);
&gt; 	printk (&quot;##val=3D%x\n&quot;, tmp_val);</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422610247.3e8dDD1.22999--

--===============1987343086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1987343086==--

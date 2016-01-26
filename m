From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Tue, 26 Jan 2016 11:14:27 +0000
Message-ID: <bug-86539-8800-Hj47uKS7TC@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1359342898=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86539-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1359342898==
Content-Type: multipart/alternative; boundary="14538068671.9D69.31352";
 charset="UTF-8"


--14538068671.9D69.31352
Date: Tue, 26 Jan 2016 11:14:27 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #7 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to Lukas Wunner from comment #6)
> To add to this discussion, radeon has a quirk for the MacBookPro8,1 wherein
> a backlight is *not* registered since this machine has a gmux built in. See
> radeon_atom_backlight_init  in atombios_encoders.c:
> 
> http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/
> atombios_encoders.c?h=drm-next#n189
> 
> 	/* Mac laptops with multiple GPUs use the gmux driver for backlight
> 	 * so don't register a backlight device
> 	 */
> 	if ((rdev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE) &&
> 	    (rdev->pdev->device == 0x6741))
> 		return;
> 
> The code is wrong though in that it tries to recognize gmux by way of the
> machine's PCI ID. The MacBookPro8,1 was available with multiple different
> AMD GPUs and we'd need to hardcode all of their PCI IDs. Also, the
> MacBookPro 11,5 has an AMD GPU and we'd need to add its PCI ID as well.
> 
> A more sensible solution, as Pierre suggests, is to detect the presence of
> gmux and not register a backlight if gmux is found. So basically a quirk
> specific to all dual GPU MacBook Pros.
> 
> This patch adds a handy function to detect the presence of gmux.
> Unfortunately noone has reviewed the series it belongs to so far:
> http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html

Hi,

I agree that having an apple_gmux_present() helper is present then the current
code in the radeon driver, and we could use that in the nouveau driver too. But
this really should not be necessary at all. Things should work fine with the
radeon / nouveau driver registering their native / BACKLIGHT_RAW backlight
interfaces in sysfs, userspace should prefer the apple_gmux sysfs entry over a
raw type sysfs entry.

This is how things work on regular x86 laptops too, which often have both an
acpi_video backlight interface and a native one, so they have 2 backlight sysfs
interfaces too.

With that said I do agree that not registering a native driver at all in these
cases is better. So I think your apple_gmux patch + matching patches in the
nouveau / ati drivers are a good idea, but I do wonder if
this is really necessary.

Eitherway we should first solve the namespace clash when nouveau tries to
register multiple backlights, that may happen in non apple weird setups too, so
is something which we should fix anyways IMHO,
and fixing that before not registering a native backlight when the apple_gmux
is present allows us to actually test that fix :)

Pierre, can you whip up a patch for the nouveau_bl name clash, and that test
that on your affected machine ? Note I understand if you will delay this till
after Fosdem :)

Regards,

Hans

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14538068671.9D69.31352
Date: Tue, 26 Jan 2016 11:14:27 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href="show_bug.cgi?id=86539#c6">comment #6</a>)
<span class="quote">&gt; To add to this discussion, radeon has a quirk for the MacBookPro8,1 wherein
&gt; a backlight is *not* registered since this machine has a gmux built in. See
&gt; radeon_atom_backlight_init  in atombios_encoders.c:
&gt; 
&gt; <a href="http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/">http://cgit.freedesktop.org/~airlied/linux/tree/drivers/gpu/drm/radeon/</a>
&gt; atombios_encoders.c?h=drm-next#n189
&gt; 
&gt; 	/* Mac laptops with multiple GPUs use the gmux driver for backlight
&gt; 	 * so don't register a backlight device
&gt; 	 */
&gt; 	if ((rdev-&gt;pdev-&gt;subsystem_vendor == PCI_VENDOR_ID_APPLE) &amp;&amp;
&gt; 	    (rdev-&gt;pdev-&gt;device == 0x6741))
&gt; 		return;
&gt; 
&gt; The code is wrong though in that it tries to recognize gmux by way of the
&gt; machine's PCI ID. The MacBookPro8,1 was available with multiple different
&gt; AMD GPUs and we'd need to hardcode all of their PCI IDs. Also, the
&gt; MacBookPro 11,5 has an AMD GPU and we'd need to add its PCI ID as well.
&gt; 
&gt; A more sensible solution, as Pierre suggests, is to detect the presence of
&gt; gmux and not register a backlight if gmux is found. So basically a quirk
&gt; specific to all dual GPU MacBook Pros.
&gt; 
&gt; This patch adds a handy function to detect the presence of gmux.
&gt; Unfortunately noone has reviewed the series it belongs to so far:
&gt; <a href="http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html">http://lists.freedesktop.org/archives/dri-devel/2016-January/098403.html</a></span >

Hi,

I agree that having an apple_gmux_present() helper is present then the current
code in the radeon driver, and we could use that in the nouveau driver too. But
this really should not be necessary at all. Things should work fine with the
radeon / nouveau driver registering their native / BACKLIGHT_RAW backlight
interfaces in sysfs, userspace should prefer the apple_gmux sysfs entry over a
raw type sysfs entry.

This is how things work on regular x86 laptops too, which often have both an
acpi_video backlight interface and a native one, so they have 2 backlight sysfs
interfaces too.

With that said I do agree that not registering a native driver at all in these
cases is better. So I think your apple_gmux patch + matching patches in the
nouveau / ati drivers are a good idea, but I do wonder if
this is really necessary.

Eitherway we should first solve the namespace clash when nouveau tries to
register multiple backlights, that may happen in non apple weird setups too, so
is something which we should fix anyways IMHO,
and fixing that before not registering a native backlight when the apple_gmux
is present allows us to actually test that fix :)

Pierre, can you whip up a patch for the nouveau_bl name clash, and that test
that on your affected machine ? Note I understand if you will delay this till
after Fosdem :)

Regards,

Hans</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14538068671.9D69.31352--

--===============1359342898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1359342898==--

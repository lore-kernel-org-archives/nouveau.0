From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Sun, 24 Jan 2016 13:32:48 +0000
Message-ID: <bug-86539-8800-mNerQAETTt@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1531594563=="
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


--===============1531594563==
Content-Type: multipart/alternative; boundary="14536423670.Aa4B164.25826";
 charset="UTF-8"


--14536423670.Aa4B164.25826
Date: Sun, 24 Jan 2016 13:32:47 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #5 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi Pierre,

(In reply to Pierre Moreau from comment #1)
> With the main card begin the 9400M we have:
> 
> * 0x61c084 = 0x0   on the 9600M GT;
> * 0x61c084 = 0x400 on the 9400M.
> 
> so only one registration for nv_backlight.
> 
> 
> However, after setting under Mac OS the 9600M GT as the main card we get:
> 
> * 0x61c084 = 0x400 on the 9600M GT;
> * 0x61c084 = 0x400 on the 9400M.
> 
> thus leading to a double registration.
> 
> 
> The NVidia driver is always forcing POST which sets 0x61c084 to 0x0 on the
> 9600M GT, solving the problem. Should we do something similar in Nouveau or
> try some other ways to go around it?
> 
> By the way the nv_backlight is useless on this setup as it does nothing: the
> backlight is controlled by the mux, and thus by the apple_gmux driver. Would
> it make sense to hide the nv_backlight in this case?

Ok, so I happen to know a bit about the whole mess which is backlight control
on PC-like platforms / laptops.

So as you mention in a later comment, we could fix the immediate problem by
making the nv_backlight name numbered, but that is not really a good fix.

Ultimately we should show only one backlight interface under
/sys/class/backlight, otherwise we are just punting the problem to userspace,
which has exactly 0% chance of correctly which backlight interface it should
actually use.

So if, as you say, the apple gmux is really controlling the backlight then the
right thing to do would be to not register nv_backlight at all on these
machines. Note that the apple gmux driver already has code to get other
backlight drivers out of the way:

drivers/platform/x86/apple-gmux.c : gmux_probe() :

        /*
         * The backlight situation on Macs is complicated. If the gmux is
         * present it's the best choice, because it always works for
         * backlight control and supports more levels than other options.
         * Disable the other backlight choices.
         */
        acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
        apple_bl_unregister();

In my rewrite / cleanup of drivers/acpi/video_detect.c I've teached the code to
automatically unregister any acpi-video backlight interface when the
backlight_type changes away from acpi_backlight_video.

Note that the driver/acpi/acpi_video.c backlight code is not necessarily
stopped from registering its backlight by the
acpi_video_set_dmi_backlight_type() call, since it may have already registered,
so the video_detect.c code will actively unregister it do deal with this
(module loading ordering problem).

I've been thinking about patching the native (type=BACKLIGHT_RAW, intel, ati
and nouveau kms driver) backlight interface code to call into
acpi_video_get_backlight_type() and to not register a backlight interface when
that returns a value != acpi_backlight_native.

As said this is something which I've been thinking about currently the "native"
drivers will always register a backlight interface, and userspace knows to
prefer non native type backlight interfaces over those if a non native type is
present. But it would be nice to just not register the native interface (and
possibly later on
also deregister them if acpi_video_get_backlight_type()'s return value changes,
by e.g. a acpi_video_set_dmi_backlight_type() call from the apple-gmux driver).

Hmm, sorry to correct myself here, but since userspace uses
(type=BACKLIGHT_RAW) sysfs backlight entries as a last resort,  that actually
means that our main problem is the nv_backlight name clash, since the apple
gmux driver has type = BACKLIGHT_PLATFORM, so the nv_backlight interface being
present is not a problem persé, as any properly writting userspace code should
prefer the apple gmux driver.

So we could add a counter to if we've already registered nv_backlight and name
the second and later interface we register nv_backlight%d (we should keep just
"nv_backlight" for the first one to not break userspace saved backlight
settings, etc.).

This seems like a worthwhile fix in general, since we may hit the same problem
elsewhere.

Sorry for the long ramble, I've been fixing backlight problems for 2 years now
and it is such a big mess ...

TLDR: The best fix is probably to fix the nv_backlight name clash by naming the
second and later backlight interfaces registered nv_backlight%d.

Regards,

Hans

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14536423670.Aa4B164.25826
Date: Sun, 24 Jan 2016 13:32:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi Pierre,

(In reply to Pierre Moreau from <a href="show_bug.cgi?id=86539#c1">comment #1</a>)
<span class="quote">&gt; With the main card begin the 9400M we have:
&gt; 
&gt; * 0x61c084 = 0x0   on the 9600M GT;
&gt; * 0x61c084 = 0x400 on the 9400M.
&gt; 
&gt; so only one registration for nv_backlight.
&gt; 
&gt; 
&gt; However, after setting under Mac OS the 9600M GT as the main card we get:
&gt; 
&gt; * 0x61c084 = 0x400 on the 9600M GT;
&gt; * 0x61c084 = 0x400 on the 9400M.
&gt; 
&gt; thus leading to a double registration.
&gt; 
&gt; 
&gt; The NVidia driver is always forcing POST which sets 0x61c084 to 0x0 on the
&gt; 9600M GT, solving the problem. Should we do something similar in Nouveau or
&gt; try some other ways to go around it?
&gt; 
&gt; By the way the nv_backlight is useless on this setup as it does nothing: the
&gt; backlight is controlled by the mux, and thus by the apple_gmux driver. Would
&gt; it make sense to hide the nv_backlight in this case?</span >

Ok, so I happen to know a bit about the whole mess which is backlight control
on PC-like platforms / laptops.

So as you mention in a later comment, we could fix the immediate problem by
making the nv_backlight name numbered, but that is not really a good fix.

Ultimately we should show only one backlight interface under
/sys/class/backlight, otherwise we are just punting the problem to userspace,
which has exactly 0% chance of correctly which backlight interface it should
actually use.

So if, as you say, the apple gmux is really controlling the backlight then the
right thing to do would be to not register nv_backlight at all on these
machines. Note that the apple gmux driver already has code to get other
backlight drivers out of the way:

drivers/platform/x86/apple-gmux.c : gmux_probe() :

        /*
         * The backlight situation on Macs is complicated. If the gmux is
         * present it's the best choice, because it always works for
         * backlight control and supports more levels than other options.
         * Disable the other backlight choices.
         */
        acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
        apple_bl_unregister();

In my rewrite / cleanup of drivers/acpi/video_detect.c I've teached the code to
automatically unregister any acpi-video backlight interface when the
backlight_type changes away from acpi_backlight_video.

Note that the driver/acpi/acpi_video.c backlight code is not necessarily
stopped from registering its backlight by the
acpi_video_set_dmi_backlight_type() call, since it may have already registered,
so the video_detect.c code will actively unregister it do deal with this
(module loading ordering problem).

I've been thinking about patching the native (type=BACKLIGHT_RAW, intel, ati
and nouveau kms driver) backlight interface code to call into
acpi_video_get_backlight_type() and to not register a backlight interface when
that returns a value != acpi_backlight_native.

As said this is something which I've been thinking about currently the &quot;native&quot;
drivers will always register a backlight interface, and userspace knows to
prefer non native type backlight interfaces over those if a non native type is
present. But it would be nice to just not register the native interface (and
possibly later on
also deregister them if acpi_video_get_backlight_type()'s return value changes,
by e.g. a acpi_video_set_dmi_backlight_type() call from the apple-gmux driver).

Hmm, sorry to correct myself here, but since userspace uses
(type=BACKLIGHT_RAW) sysfs backlight entries as a last resort,  that actually
means that our main problem is the nv_backlight name clash, since the apple
gmux driver has type = BACKLIGHT_PLATFORM, so the nv_backlight interface being
present is not a problem persé, as any properly writting userspace code should
prefer the apple gmux driver.

So we could add a counter to if we've already registered nv_backlight and name
the second and later interface we register nv_backlight%d (we should keep just
&quot;nv_backlight&quot; for the first one to not break userspace saved backlight
settings, etc.).

This seems like a worthwhile fix in general, since we may hit the same problem
elsewhere.

Sorry for the long ramble, I've been fixing backlight problems for 2 years now
and it is such a big mess ...

TLDR: The best fix is probably to fix the nv_backlight name clash by naming the
second and later backlight interfaces registered nv_backlight%d.

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
--14536423670.Aa4B164.25826--

--===============1531594563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1531594563==--

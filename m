From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] nVidia 9600M GT (Macbook Pro current model)
 is unable to boot
Date: Wed, 21 Aug 2013 04:21:07 +0000
Message-ID: <bug-27501-8800-dQ1fjlM5q1@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2055262081=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2055262081==
Content-Type: multipart/alternative; boundary="1377058867.4cceD6.30427"; charset="us-ascii"


--1377058867.4cceD6.30427
Date: Wed, 21 Aug 2013 04:21:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #27 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You guys are probably all aware of this, but it seems like one solution is to
have the bootloader kill the NV96 card on boot, if you're using grub2:

https://help.ubuntu.com/community/UEFIBooting#Selecting_the_graphic_card
http://askubuntu.com/questions/149921/how-to-add-a-command-permanently-to-grub2

One could also make an early quirk that does this as well based on a DMI match.
I wrote up a quick patch to do that, but it's completely untested (see below).
I doubt it'd be upstream-appropriate though, as it would kill the possibility
of using the second card entirely.

diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 230c8ea..8cb7665 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -1357,6 +1357,12 @@ static int __init dmi_ignore_irq0_timer_override(const
struct dmi_system_id *d)
        return 0;
 }

+static int __init disable_macbook_second_video(const struct dmi_system_id *d)
+{
+       outb(0, 0x750);
+       return 0;
+}
+
 /*
  * If your system is blacklisted here, but you find that acpi=force
  * works for you, please contact linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
@@ -1432,6 +1438,15 @@ static struct dmi_system_id __initdata acpi_dmi_table[]
= {
                     DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 360"),
                     },
         },
+       {
+        .callback = disable_macbook_second_video,
+        .ident = "Apple MacBook5",
+        .matches = {
+                    DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+                    DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5"),
+                    },
+        },
+
        {}
 };

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377058867.4cceD6.30427
Date: Wed, 21 Aug 2013 04:21:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nVidia 9600M GT (Macbook Pro current model) is unable to boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nVidia 9600M GT (Macbook Pro current model) is unable to boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You guys are probably all aware of this, but it seems like one solution is to
have the bootloader kill the NV96 card on boot, if you're using grub2:

<a href="https://help.ubuntu.com/community/UEFIBooting#Selecting_the_graphic_card">https://help.ubuntu.com/community/UEFIBooting#Selecting_the_graphic_card</a>
<a href="http://askubuntu.com/questions/149921/how-to-add-a-command-permanently-to-grub2">http://askubuntu.com/questions/149921/how-to-add-a-command-permanently-to-grub2</a>

One could also make an early quirk that does this as well based on a DMI match.
I wrote up a quick patch to do that, but it's completely untested (see below).
I doubt it'd be upstream-appropriate though, as it would kill the possibility
of using the second card entirely.

diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 230c8ea..8cb7665 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
&#64;&#64; -1357,6 +1357,12 &#64;&#64; static int __init dmi_ignore_irq0_timer_override(const
struct dmi_system_id *d)
        return 0;
 }

+static int __init disable_macbook_second_video(const struct dmi_system_id *d)
+{
+       outb(0, 0x750);
+       return 0;
+}
+
 /*
  * If your system is blacklisted here, but you find that acpi=force
  * works for you, please contact <a href="mailto:linux-acpi&#64;vger.kernel.org">linux-acpi&#64;vger.kernel.org</a>
&#64;&#64; -1432,6 +1438,15 &#64;&#64; static struct dmi_system_id __initdata acpi_dmi_table[]
= {
                     DMI_MATCH(DMI_PRODUCT_NAME, &quot;TravelMate 360&quot;),
                     },
         },
+       {
+        .callback = disable_macbook_second_video,
+        .ident = &quot;Apple MacBook5&quot;,
+        .matches = {
+                    DMI_MATCH(DMI_SYS_VENDOR, &quot;Apple Inc.&quot;),
+                    DMI_MATCH(DMI_PRODUCT_NAME, &quot;MacBook5&quot;),
+                    },
+        },
+
        {}
 };</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377058867.4cceD6.30427--

--===============2055262081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2055262081==--

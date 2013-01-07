From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Mon, 07 Jan 2013 01:53:46 +0000
Message-ID: <bug-56461-8800-FYmjlVIYZw@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988714856=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0988714856==
Content-Type: multipart/alternative; boundary="1357523626.D3Aec2.18220"; charset="us-ascii"


--1357523626.D3Aec2.18220
Date: Mon, 7 Jan 2013 01:53:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #41 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
Hi,

I've been looking at the 'hsync' problem I first mentioned in comment 25. This
problem seems to be caused by any interaction with i2c bus 2 and was uncovered
by commit 486a45c2, because it fixed a previous bug...

My VBIOS lists 3 i2c buses. Bus 0 is referenced by DCB entry 0 - 
OUTPUT_ANALOGUE. Bus 1 is referenced by DCB entries 1 & 2 - OUTPUT_LVDS &
OUTPUT_TV.

Prior to 486a45c2, bus 2 is never properly driven because nouveau_i2c_init() is
called without there having been a call to read_dcb_i2c_entry() for index 2, so
the bit-bang i2c adapter gets set up with 0 for the rd & wr variables (a later
commit renames these to sense & drive). Surprisingly, the resulting incorrect
CRTC register read/writes don't seem to trash the system and everything works
okay.

Commit 486a45c2 fixes the bug by parsing all 3 i2c entries up-front, so bus 2
gets a bit-bang i2c adapter with sensible rd & wr values. However, any access
to this bus seems to cause the display to show the 'hsync' problem. The only
reference to the bus is from nouveau_temp_probe_i2c(), so I've worked around
the problem with the following hack:

--- a/drivers/gpu/drm/nouveau/nouveau_temp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_temp.c
@@ -287,11 +287,13 @@ static void
 nouveau_temp_probe_i2c(struct drm_device *dev)
 {
     struct i2c_board_info info[] = {
+#if 0
         { I2C_BOARD_INFO("w83l785ts", 0x2d) },
         { I2C_BOARD_INFO("w83781d", 0x2d) },
         { I2C_BOARD_INFO("adt7473", 0x2e) },
         { I2C_BOARD_INFO("f75375", 0x2e) },
         { I2C_BOARD_INFO("lm99", 0x4c) },
+#endif
         { }
     };

Re-adding any of the I2C_BOARD_INFO lines - I tried them 1 at a time - makes
the problem come back. The simple 1 byte address test i2c transfer is enough to
trigger the problem.

The above work around is enough to make my display work again for commit
486a45c2, but the problem comes back in a later commit when the i2c lines are
reset in the bit-bang adapter init code. I've had to add the following hack to
work around the problem again:

--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
@@ -327,9 +333,13 @@ nouveau_i2c_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
         i2c_set_adapdata(&port->adapter, i2c);

         if (port->adapter.algo != &nouveau_i2c_aux_algo) {
+            if(i==2) {
+            nv_warn(i2c, "I2C%d: type %d index %x/%x - supressing scl/sda
init\n", i, port->type, port->drive, port->sense);
+            } else {
             nouveau_i2c_drive_scl(port, 0);
             nouveau_i2c_drive_sda(port, 1);
             nouveau_i2c_drive_scl(port, 1);
+            }

So it appears that even this simple attempt to reset the i2c lines on bus 2 is
enough to destabilise the display.

Obviously, these 2 hacks will need to be replaced with something better, but
I've no idea what - perhaps a board specific i2c bus blacklist!

None of this makes any difference to the fade-to-back problem introduced by
commit cb75d97e, but I can now get its parent commit 70790f4f working. In
summary, this is where I am:

70790f4f + 3bb076af + dpms-fix + i2c-2-hacks  -  works
cb75d97e + 3bb076af + dpms-fix + i2c-2-hacks  -  fades to black

Looking at the console output from these 2 tests, the only significant change
seems to be a change of the AGP GART aperture from a sensible 64 MiB to 3712
MiB, which doesn't look right. The GART seem to be initialised later than
before too.

Regards,
Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357523626.D3Aec2.18220
Date: Mon, 7 Jan 2013 01:53:46 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>Hi,

I've been looking at the 'hsync' problem I first mentioned in <a href="show_bug.cgi?id=56461#c25">comment 25</a>. This
problem seems to be caused by any interaction with i2c bus 2 and was uncovered
by commit 486a45c2, because it fixed a previous bug...

My VBIOS lists 3 i2c buses. Bus 0 is referenced by DCB entry 0 - 
OUTPUT_ANALOGUE. Bus 1 is referenced by DCB entries 1 &amp; 2 - OUTPUT_LVDS &amp;
OUTPUT_TV.

Prior to 486a45c2, bus 2 is never properly driven because nouveau_i2c_init() is
called without there having been a call to read_dcb_i2c_entry() for index 2, so
the bit-bang i2c adapter gets set up with 0 for the rd &amp; wr variables (a later
commit renames these to sense &amp; drive). Surprisingly, the resulting incorrect
CRTC register read/writes don't seem to trash the system and everything works
okay.

Commit 486a45c2 fixes the bug by parsing all 3 i2c entries up-front, so bus 2
gets a bit-bang i2c adapter with sensible rd &amp; wr values. However, any access
to this bus seems to cause the display to show the 'hsync' problem. The only
reference to the bus is from nouveau_temp_probe_i2c(), so I've worked around
the problem with the following hack:

--- a/drivers/gpu/drm/nouveau/nouveau_temp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_temp.c
&#64;&#64; -287,11 +287,13 &#64;&#64; static void
 nouveau_temp_probe_i2c(struct drm_device *dev)
 {
     struct i2c_board_info info[] = {
+#if 0
         { I2C_BOARD_INFO(&quot;w83l785ts&quot;, 0x2d) },
         { I2C_BOARD_INFO(&quot;w83781d&quot;, 0x2d) },
         { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2e) },
         { I2C_BOARD_INFO(&quot;f75375&quot;, 0x2e) },
         { I2C_BOARD_INFO(&quot;lm99&quot;, 0x4c) },
+#endif
         { }
     };

Re-adding any of the I2C_BOARD_INFO lines - I tried them 1 at a time - makes
the problem come back. The simple 1 byte address test i2c transfer is enough to
trigger the problem.

The above work around is enough to make my display work again for commit
486a45c2, but the problem comes back in a later commit when the i2c lines are
reset in the bit-bang adapter init code. I've had to add the following hack to
work around the problem again:

--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
&#64;&#64; -327,9 +333,13 &#64;&#64; nouveau_i2c_ctor(struct nouveau_object *parent, struct
nouveau_object *engine,
         i2c_set_adapdata(&amp;port-&gt;adapter, i2c);

         if (port-&gt;adapter.algo != &amp;nouveau_i2c_aux_algo) {
+            if(i==2) {
+            nv_warn(i2c, &quot;I2C%d: type %d index %x/%x - supressing scl/sda
init\n&quot;, i, port-&gt;type, port-&gt;drive, port-&gt;sense);
+            } else {
             nouveau_i2c_drive_scl(port, 0);
             nouveau_i2c_drive_sda(port, 1);
             nouveau_i2c_drive_scl(port, 1);
+            }

So it appears that even this simple attempt to reset the i2c lines on bus 2 is
enough to destabilise the display.

Obviously, these 2 hacks will need to be replaced with something better, but
I've no idea what - perhaps a board specific i2c bus blacklist!

None of this makes any difference to the fade-to-back problem introduced by
commit cb75d97e, but I can now get its parent commit 70790f4f working. In
summary, this is where I am:

70790f4f + 3bb076af + dpms-fix + i2c-2-hacks  -  works
cb75d97e + 3bb076af + dpms-fix + i2c-2-hacks  -  fades to black

Looking at the console output from these 2 tests, the only significant change
seems to be a change of the AGP GART aperture from a sensible 64 MiB to 3712
MiB, which doesn't look right. The GART seem to be initialised later than
before too.

Regards,
Chris.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357523626.D3Aec2.18220--

--===============0988714856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0988714856==--

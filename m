From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58784] New: Nouveau on NVCE,
 reclocking: memory type not supported?
Date: Wed, 26 Dec 2012 20:12:18 +0000
Message-ID: <bug-58784-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2138256701=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2138256701==
Content-Type: multipart/alternative; boundary="1356552738.42ACc51.31927"; charset="us-ascii"


--1356552738.42ACc51.31927
Date: Wed, 26 Dec 2012 20:12:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58784

          Priority: medium
            Bug ID: 58784
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau on NVCE, reclocking: memory type not
                    supported?
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: miga-anyandall-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 72144
  --> https://bugs.freedesktop.org/attachment.cgi?id=72144&action=edit
lspci_output, nvce_strap_peek, nvce_timing_peek, nvce_bios.rom, and
nvce_vbios_parsed

I understand reclocking on Nouveau is very experimental still, but I figured I
might as well send in this bug report anyway.

On my NVCE (GTX 560 from EVGA), the standard (boot) clock speeds are 50 MHz
core, 100 MHz shader, and 135 MHz memory. Naturally because of this, OpenGL
performance is terrible (possibly worse than older Intel chips like the
4500HD), about 15-20 FPS in Red Eclipse and about 5 FPS in Xonotic.

I am able to reclock the card, however, upon doing so, it comes up with this
error in dmesg:
[11245.600378] nouveau E[     DRM] cannot reclock unsupported memtype

So, I'm able to get the GPU core and shader to run at their highest speeds (850
MHz and 1701 MHz respectively), but the memory speed stays at 135 MHz (when it
should be at 2052 MHz). Even though I can change the clock speeds, after a
while, the card will crash, forcing me to have to reboot.

I'm also uploading things such as my lspci_output, nvce_strap_peek,
nvce_timing_peek, nvce_bios.rom, and nvce_vbios_parsed, so it'll hopefully help
you guys out on getting things working.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356552738.42ACc51.31927
Date: Wed, 26 Dec 2012 20:12:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau on NVCE, reclocking: memory type not supported?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58784">58784</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau on NVCE, reclocking: memory type not supported?
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>miga-anyandall&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=72144" name="attach_72144" title="lspci_output, nvce_strap_peek, nvce_timing_peek, nvce_bios.rom, and nvce_vbios_parsed">attachment 72144</a> <a href="attachment.cgi?id=72144&amp;action=edit" title="lspci_output, nvce_strap_peek, nvce_timing_peek, nvce_bios.rom, and nvce_vbios_parsed">[details]</a></span>
lspci_output, nvce_strap_peek, nvce_timing_peek, nvce_bios.rom, and
nvce_vbios_parsed

I understand reclocking on Nouveau is very experimental still, but I figured I
might as well send in this bug report anyway.

On my NVCE (GTX 560 from EVGA), the standard (boot) clock speeds are 50 MHz
core, 100 MHz shader, and 135 MHz memory. Naturally because of this, OpenGL
performance is terrible (possibly worse than older Intel chips like the
4500HD), about 15-20 FPS in Red Eclipse and about 5 FPS in Xonotic.

I am able to reclock the card, however, upon doing so, it comes up with this
error in dmesg:
[11245.600378] nouveau E[     DRM] cannot reclock unsupported memtype

So, I'm able to get the GPU core and shader to run at their highest speeds (850
MHz and 1701 MHz respectively), but the memory speed stays at 135 MHz (when it
should be at 2052 MHz). Even though I can change the clock speeds, after a
while, the card will crash, forcing me to have to reboot.

I'm also uploading things such as my lspci_output, nvce_strap_peek,
nvce_timing_peek, nvce_bios.rom, and nvce_vbios_parsed, so it'll hopefully help
you guys out on getting things working.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356552738.42ACc51.31927--

--===============2138256701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2138256701==--

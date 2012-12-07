From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57988] New: [regression][bisected][NV4E] LVDS output
 has offset to the right, part falling of is painted on the left
Date: Fri, 07 Dec 2012 16:36:22 +0000
Message-ID: <bug-57988-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0493556741=="
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


--===============0493556741==
Content-Type: multipart/alternative; boundary="1354898183.d20Ac1D1.19038"; charset="us-ascii"


--1354898183.d20Ac1D1.19038
Date: Fri, 7 Dec 2012 16:36:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57988

          Priority: medium
            Bug ID: 57988
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [regression][bisected][NV4E] LVDS output has offset to
                    the right, part falling of is painted on the left
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 71137
  --> https://bugs.freedesktop.org/attachment.cgi?id=71137&action=edit
Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)

Commit:

767baf828498: drm/nouveau: remove some more unnecessary legacy bios code

causes a regression. Attached are dmesg logs and photographs (since the title
probably won't cut it).

Symptoms are:

- screen is dislocated to the right causing part of the screen to fall off
- the part that falls of the screen is improperly repainted on the left side,
seems like a mirror effect in that this repainting is happening twice
- upper part of the screen has a horizontal bar that is probably 1 or 2 pixels
thick. Desktop is displayed there, but it's scrambled.

This is with an 'C51 (NV4E)' chipset.

Mupuf on #nouveau mentioned removing the ' #if 0 / #endif ' parts in this
commit and see if that rebuilds. I added 'pll_limit_tbl_ptr' back to
nouveau_bios.h to make it compile. This does not help. Bug is still there. The
dmesg log 'attempt' contains the dmesg output with this modification.

Mupuf also mentioned that 'it clearly is a PLL calculation problem'. Therefore,
I also refer back to previous fdo bug #56202 . This was also related to 'PLL'
(I have no idea what it is though)...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354898183.d20Ac1D1.19038
Date: Fri, 7 Dec 2012 16:36:23 +0000
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
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988">57988</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][bisected][NV4E] LVDS output has offset to the right, part falling of is painted on the left
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
          <td>ronald645&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=71137" name="attach_71137" title="Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)">attachment 71137</a> <a href="attachment.cgi?id=71137&amp;action=edit" title="Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)">[details]</a></span>
Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)

Commit:

767baf828498: drm/nouveau: remove some more unnecessary legacy bios code

causes a regression. Attached are dmesg logs and photographs (since the title
probably won't cut it).

Symptoms are:

- screen is dislocated to the right causing part of the screen to fall off
- the part that falls of the screen is improperly repainted on the left side,
seems like a mirror effect in that this repainting is happening twice
- upper part of the screen has a horizontal bar that is probably 1 or 2 pixels
thick. Desktop is displayed there, but it's scrambled.

This is with an 'C51 (NV4E)' chipset.

Mupuf on #nouveau mentioned removing the ' #if 0 / #endif ' parts in this
commit and see if that rebuilds. I added 'pll_limit_tbl_ptr' back to
nouveau_bios.h to make it compile. This does not help. Bug is still there. The
dmesg log 'attempt' contains the dmesg output with this modification.

Mupuf also mentioned that 'it clearly is a PLL calculation problem'. Therefore,
I also refer back to previous fdo <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="show_bug.cgi?id=56202">bug #56202</a> . This was also related to 'PLL'
(I have no idea what it is though)...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354898183.d20Ac1D1.19038--

--===============0493556741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0493556741==--

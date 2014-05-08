From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] New: X does not start under kernel 3.13.x
Date: Thu, 08 May 2014 13:52:11 +0000
Message-ID: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1329777372=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1329777372==
Content-Type: multipart/alternative; boundary="1399557131.304d621.15114"; charset="us-ascii"


--1399557131.304d621.15114
Date: Thu, 8 May 2014 13:52:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

          Priority: medium
            Bug ID: 78441
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: X does not start under kernel 3.13.x
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 98691
  --> https://bugs.freedesktop.org/attachment.cgi?id=98691&action=edit
output from dmesg with buffer set to 1M

X starts just fine under 3.12.x for me, but fails under 3.13.x.  I waited for a
few versions to see if the problem would be found/fixed by others, but we're
now up to 3.13.11 (under Fedora 19) and it still fails.  Booting back into
3.12.11 works fine.

Forgive me if more information (beyond the kernel log and Xorg.0.log) would be
helpful... I'm fairly green at working at this level of the O/S.  Please ask
for whatever you need.  lspci shows the graphics card as "NVIDIA Corporation
G86 [Quadro NVS 290] (rev a1)" and the kernel log repors "Chipset: G72 (NV46)",
"Family : NV40".

Again, please let me know if I can provide more useful diagnostic info.

Oh, and at time index 638.685456 of the kernel log I had started switching to
alt-consoles.  Until that point there were no additional log messages
generated.

Thanks,

Adam Benjamin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399557131.304d621.15114
Date: Thu, 8 May 2014 13:52:11 +0000
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
   title="NEW --- - X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">78441</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X does not start under kernel 3.13.x
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
          <td>aebenjam&#64;opentext.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98691" name="attach_98691" title="output from dmesg with buffer set to 1M">attachment 98691</a> <a href="attachment.cgi?id=98691&amp;action=edit" title="output from dmesg with buffer set to 1M">[details]</a></span>
output from dmesg with buffer set to 1M

X starts just fine under 3.12.x for me, but fails under 3.13.x.  I waited for a
few versions to see if the problem would be found/fixed by others, but we're
now up to 3.13.11 (under Fedora 19) and it still fails.  Booting back into
3.12.11 works fine.

Forgive me if more information (beyond the kernel log and Xorg.0.log) would be
helpful... I'm fairly green at working at this level of the O/S.  Please ask
for whatever you need.  lspci shows the graphics card as &quot;NVIDIA Corporation
G86 [Quadro NVS 290] (rev a1)&quot; and the kernel log repors &quot;Chipset: G72 (NV46)&quot;,
&quot;Family : NV40&quot;.

Again, please let me know if I can provide more useful diagnostic info.

Oh, and at time index 638.685456 of the kernel log I had started switching to
alt-consoles.  Until that point there were no additional log messages
generated.

Thanks,

Adam Benjamin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399557131.304d621.15114--

--===============1329777372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1329777372==--

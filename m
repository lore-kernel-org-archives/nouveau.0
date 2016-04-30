From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95212] New: GT215GLM Rendering hickups with
	gnome-shell
Date: Sat, 30 Apr 2016 11:30:30 +0000
Message-ID: <bug-95212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0105776075=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0105776075==
Content-Type: multipart/alternative; boundary="14620158300.5110D5c6.27985";
 charset="UTF-8"


--14620158300.5110D5c6.27985
Date: Sat, 30 Apr 2016 11:30:30 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95212

            Bug ID: 95212
           Summary: GT215GLM Rendering hickups with gnome-shell
           Product: Mesa
           Version: 11.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tomas.chvatal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 123364
  --> https://bugs.freedesktop.org/attachment.cgi?id=123364&action=edit
dmesg.log

With the nouveau there are rendering issues like disortion on the screen or
actual textures missing. The server is not crashing, yet the rendering errors
happen too often for any reasonable usage.

Card is:
01:00.0 VGA compatible controller: NVIDIA Corporation GT215GLM [Quadro FX
1800M] (rev a2)


Error looks like:
[  942.990602] nouveau 0000:01:00.0: gr: magic set 1:
[  942.990612] nouveau 0000:01:00.0: gr:     00408e04: ae28bf08
[  942.990615] nouveau 0000:01:00.0: gr:     00408e08: ed00f7d6
[  942.990617] nouveau 0000:01:00.0: gr:     00408e0c: 40000430
[  942.990622] nouveau 0000:01:00.0: gr:     00408e10: e9e90000
[  942.990625] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP1: 00000003 [ FAULT]
[  942.990628] nouveau 0000:01:00.0: gr: magic set 2:
[  942.990631] nouveau 0000:01:00.0: gr:     00409604: ae28ae08
[  942.990634] nouveau 0000:01:00.0: gr:     00409608: ed00f7d6
[  942.990636] nouveau 0000:01:00.0: gr:     0040960c: 40000430
[  942.990638] nouveau 0000:01:00.0: gr:     00409610: e9e90000
[  942.990640] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP2: 00000003 [ FAULT]
[  942.990642] nouveau 0000:01:00.0: gr: magic set 3:
[  942.990645] nouveau 0000:01:00.0: gr:     00409e04: ae286308
[  942.990647] nouveau 0000:01:00.0: gr:     00409e08: ed00f7d6
[  942.990649] nouveau 0000:01:00.0: gr:     00409e0c: 40000430
[  942.990652] nouveau 0000:01:00.0: gr:     00409e10: e9e90000
[  942.990653] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP3: 00000003 [ FAULT]
[  942.990656] nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f939000
gnome-shell[1993]] subc 3 class 8597 mthd 15e0 data 00000000
[  942.990668] nouveau 0000:01:00.0: fb: trapped read at ed00f7d600 on channel
6 [3f939000 gnome-shell[1993]] engine 00 [PGRAPH] client 0a [TEXTURE] subclient
00 [] reason 00000000 [PT_NOT_PRESENT]

Full output stored in dmesg.log attachment

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14620158300.5110D5c6.27985
Date: Sat, 30 Apr 2016 11:30:30 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GT215GLM Rendering hickups with gnome-shell"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95212">95212</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT215GLM Rendering hickups with gnome-shell
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>tomas.chvatal&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123364" name="attach_123364" title="dmesg.log">attachment 123364</a> <a href="attachment.cgi?id=123364&amp;action=edit" title="dmesg.log">[details]</a></span>
dmesg.log

With the nouveau there are rendering issues like disortion on the screen or
actual textures missing. The server is not crashing, yet the rendering errors
happen too often for any reasonable usage.

Card is:
01:00.0 VGA compatible controller: NVIDIA Corporation GT215GLM [Quadro FX
1800M] (rev a2)


Error looks like:
[  942.990602] nouveau 0000:01:00.0: gr: magic set 1:
[  942.990612] nouveau 0000:01:00.0: gr:     00408e04: ae28bf08
[  942.990615] nouveau 0000:01:00.0: gr:     00408e08: ed00f7d6
[  942.990617] nouveau 0000:01:00.0: gr:     00408e0c: 40000430
[  942.990622] nouveau 0000:01:00.0: gr:     00408e10: e9e90000
[  942.990625] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP1: 00000003 [ FAULT]
[  942.990628] nouveau 0000:01:00.0: gr: magic set 2:
[  942.990631] nouveau 0000:01:00.0: gr:     00409604: ae28ae08
[  942.990634] nouveau 0000:01:00.0: gr:     00409608: ed00f7d6
[  942.990636] nouveau 0000:01:00.0: gr:     0040960c: 40000430
[  942.990638] nouveau 0000:01:00.0: gr:     00409610: e9e90000
[  942.990640] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP2: 00000003 [ FAULT]
[  942.990642] nouveau 0000:01:00.0: gr: magic set 3:
[  942.990645] nouveau 0000:01:00.0: gr:     00409e04: ae286308
[  942.990647] nouveau 0000:01:00.0: gr:     00409e08: ed00f7d6
[  942.990649] nouveau 0000:01:00.0: gr:     00409e0c: 40000430
[  942.990652] nouveau 0000:01:00.0: gr:     00409e10: e9e90000
[  942.990653] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP3: 00000003 [ FAULT]
[  942.990656] nouveau 0000:01:00.0: gr: 00200000 [] ch 6 [003f939000
gnome-shell[1993]] subc 3 class 8597 mthd 15e0 data 00000000
[  942.990668] nouveau 0000:01:00.0: fb: trapped read at ed00f7d600 on channel
6 [3f939000 gnome-shell[1993]] engine 00 [PGRAPH] client 0a [TEXTURE] subclient
00 [] reason 00000000 [PT_NOT_PRESENT]

Full output stored in dmesg.log attachment</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14620158300.5110D5c6.27985--

--===============0105776075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0105776075==--

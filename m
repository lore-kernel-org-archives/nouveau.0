From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] New: INVALID_STATE [UNK05] chid 0 mthd 0x0080
 data 0x00000000
Date: Thu, 18 Dec 2014 11:06:07 +0000
Message-ID: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1323081289=="
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


--===============1323081289==
Content-Type: multipart/alternative; boundary="1418900768.1fC3d1.25867"; charset="UTF-8"


--1418900768.1fC3d1.25867
Date: Thu, 18 Dec 2014 11:06:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

            Bug ID: 87436
           Summary: INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
                    0x00000000
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: l.bigonville-/PFmmAUIoI+zQB+pC5nmwQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 110978
  --> https://bugs.freedesktop.org/attachment.cgi?id=110978&action=edit
dmesg output

Hello,

On my debian unstable (kernel 3.18, nouveau driver: 1.0.11, xserver:
1.16.2.901), I'm seeing the following messages in dmesg:

[ 2699.275904] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK05] chid 0
mthd 0x0080 data 0x00000000
[ 2699.275909] nouveau E[   PDISP][0000:01:00.0] Core:
[ 2699.275915] nouveau E[   PDISP][0000:01:00.0]        0x0084: 0x02580320 ->
0x00000000
[ 2699.275921] nouveau E[   PDISP][0000:01:00.0]        0x0088: 0xf0000000
[ 2699.275923] nouveau E[   PDISP][0000:01:00.0] Core - DAC 0:


This looks like bug #85160 or bug #84203 but the proposed patches on these bugs
seems to be integrated on the version of the kernel I'm using

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418900768.1fC3d1.25867
Date: Thu, 18 Dec 2014 11:06:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">87436</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>l.bigonville&#64;edpnet.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=110978" name="attach_110978" title="dmesg output">attachment 110978</a> <a href="attachment.cgi?id=110978&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

Hello,

On my debian unstable (kernel 3.18, nouveau driver: 1.0.11, xserver:
1.16.2.901), I'm seeing the following messages in dmesg:

[ 2699.275904] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK05] chid 0
mthd 0x0080 data 0x00000000
[ 2699.275909] nouveau E[   PDISP][0000:01:00.0] Core:
[ 2699.275915] nouveau E[   PDISP][0000:01:00.0]        0x0084: 0x02580320 -&gt;
0x00000000
[ 2699.275921] nouveau E[   PDISP][0000:01:00.0]        0x0088: 0xf0000000
[ 2699.275923] nouveau E[   PDISP][0000:01:00.0] Core - DAC 0:


This looks like <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="show_bug.cgi?id=85160">bug #85160</a> or <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] HDMI gives no more signal since 3.15 (optimus)"
   href="show_bug.cgi?id=84203">bug #84203</a> but the proposed patches on these bugs
seems to be integrated on the version of the kernel I'm using</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418900768.1fC3d1.25867--

--===============1323081289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1323081289==--

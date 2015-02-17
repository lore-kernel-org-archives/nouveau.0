From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89186] New: Artifacts after waking up from suspend
Date: Tue, 17 Feb 2015 13:34:06 +0000
Message-ID: <bug-89186-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0257271164=="
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


--===============0257271164==
Content-Type: multipart/alternative; boundary="1424180046.850dE0a1.31476"; charset="UTF-8"


--1424180046.850dE0a1.31476
Date: Tue, 17 Feb 2015 13:34:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89186

            Bug ID: 89186
           Summary: Artifacts after waking up from suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: janluca-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi,

I'm using a Lenovo Thinkpad T61 8889-B35 with a NVIDIA G86M [Quadro NVS 140M].
After waking the notebook up from suspend I get only black and white artifacts
on my display. I can switch to the normal text-console tty without a problem. 

In the dmesg outputs there a follwing lines (full log attached):

[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout
fail
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  : 0x011fde01
BUSY VFETCH CCACHE_PREGEOM STRMOUT_VATTR_POSTGEOM VCLIP TRAST CLIPID ZCULL
ENG2D RMASK TPC_RAST TPC_PROP ROP
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0: 0x00145b49
VFETCH CCACHE
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1: 0x0000002d
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2: 0x0034db40
ENG2D ROP

I have attached the output of lspci -vvv, too.

Best regards,
Jan

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424180046.850dE0a1.31476
Date: Tue, 17 Feb 2015 13:34:06 +0000
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
   title="NEW - Artifacts after waking up from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89186">89186</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Artifacts after waking up from suspend
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>janluca&#64;physik.fu-berlin.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I'm using a Lenovo Thinkpad T61 8889-B35 with a NVIDIA G86M [Quadro NVS 140M].
After waking the notebook up from suspend I get only black and white artifacts
on my display. I can switch to the normal text-console tty without a problem. 

In the dmesg outputs there a follwing lines (full log attached):

[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout
fail
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  : 0x011fde01
BUSY VFETCH CCACHE_PREGEOM STRMOUT_VATTR_POSTGEOM VCLIP TRAST CLIPID ZCULL
ENG2D RMASK TPC_RAST TPC_PROP ROP
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0: 0x00145b49
VFETCH CCACHE
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1: 0x0000002d
[  625.471095] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2: 0x0034db40
ENG2D ROP

I have attached the output of lspci -vvv, too.

Best regards,
Jan</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424180046.850dE0a1.31476--

--===============0257271164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0257271164==--

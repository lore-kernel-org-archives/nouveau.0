From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] New: Desktop periodically freezes when using
 Nouveau & getting "nouveau E[PDISP]" errors in dmesg
Date: Thu, 14 May 2015 16:42:30 +0000
Message-ID: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0739070845=="
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


--===============0739070845==
Content-Type: multipart/alternative; boundary="1431621750.Ded0F311.18620"; charset="UTF-8"


--1431621750.Ded0F311.18620
Date: Thu, 14 May 2015 16:42:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

            Bug ID: 90453
           Summary: Desktop periodically freezes when using Nouveau &
                    getting "nouveau E[PDISP]" errors in dmesg
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115775
  --> https://bugs.freedesktop.org/attachment.cgi?id=115775&action=edit
output of `dmesg`

Since switching to Nouveau, a couple of hours after booting my system, the
display will freeze up. I can still move the mouse, and I can still hear the
sound of any media-player or YouTube still running. Sometimes, I can still go
to another terminal with Ctrl-Alt-F2, sometimes not. One time when I could, I
restarted X and it would just work again.

(Additionally, the frame rate seems a bit 'stuttery' compared to the binary
NVidia drivers, especially when moving windows around and such. That may or may
not be a separate issue.)

There are a bunch of nvidia errors in my dmesg output that I do not understand.
I attached this output.

I'd be happy to provide any extra info you need, but would also much appreciate
any workaround I could use.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431621750.Ded0F311.18620
Date: Thu, 14 May 2015 16:42:30 +0000
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
   title="NEW - Desktop periodically freezes when using Nouveau &amp; getting &quot;nouveau E[PDISP]&quot; errors in dmesg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">90453</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Desktop periodically freezes when using Nouveau &amp; getting &quot;nouveau E[PDISP]&quot; errors in dmesg
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
          <td>critical
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
          <td>mhelvens&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115775" name="attach_115775" title="output of `dmesg`">attachment 115775</a> <a href="attachment.cgi?id=115775&amp;action=edit" title="output of `dmesg`">[details]</a></span>
output of `dmesg`

Since switching to Nouveau, a couple of hours after booting my system, the
display will freeze up. I can still move the mouse, and I can still hear the
sound of any media-player or YouTube still running. Sometimes, I can still go
to another terminal with Ctrl-Alt-F2, sometimes not. One time when I could, I
restarted X and it would just work again.

(Additionally, the frame rate seems a bit 'stuttery' compared to the binary
NVidia drivers, especially when moving windows around and such. That may or may
not be a separate issue.)

There are a bunch of nvidia errors in my dmesg output that I do not understand.
I attached this output.

I'd be happy to provide any extra info you need, but would also much appreciate
any workaround I could use.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431621750.Ded0F311.18620--

--===============0739070845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0739070845==--

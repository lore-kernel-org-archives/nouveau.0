From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91247] New: Tomb Raider: Underworld renders lots of
 artefacts on models and objects
Date: Mon, 06 Jul 2015 17:01:59 +0000
Message-ID: <bug-91247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1139421270=="
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


--===============1139421270==
Content-Type: multipart/alternative; boundary="1436202119.F6FFf0b0.5997"; charset="UTF-8"


--1436202119.F6FFf0b0.5997
Date: Mon, 6 Jul 2015 17:01:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91247

            Bug ID: 91247
           Summary: Tomb Raider: Underworld renders lots of artefacts on
                    models and objects
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 116980
  --> https://bugs.freedesktop.org/attachment.cgi?id=116980&action=edit
screenshot showing the problem

Character models and certain objects in the game have lots of flickering
artefacts.

No artefacts with llvmpipe, the Nvidia binary driver also renders models
correctly.Disabling shader optimization doesn't help.

I see lots of these warnings in the terminal:
>WARNING: out of code space, evicting all shaders.
and
>WARNING: value %505 not uniquely defined
>WARNING: value %440 not uniquely defined
>WARNING: value %503 not uniquely defined
>...

Trace (uncompressed 350 MB):
https://drive.google.com/open?id=0B-tTbLKBl-tOOWhES3ZJaGlHeXc

Fedora 22 32-bit
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Kernel 4.0.6-300.fc22.i686+PAE
libdrm, nouveau ddx, Mesa from git

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436202119.F6FFf0b0.5997
Date: Mon, 6 Jul 2015 17:01:59 +0000
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
   title="NEW - Tomb Raider: Underworld renders lots of artefacts on models and objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91247">91247</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Tomb Raider: Underworld renders lots of artefacts on models and objects
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116980" name="attach_116980" title="screenshot showing the problem">attachment 116980</a> <a href="attachment.cgi?id=116980&amp;action=edit" title="screenshot showing the problem">[details]</a></span>
screenshot showing the problem

Character models and certain objects in the game have lots of flickering
artefacts.

No artefacts with llvmpipe, the Nvidia binary driver also renders models
correctly.Disabling shader optimization doesn't help.

I see lots of these warnings in the terminal:
<span class="quote">&gt;WARNING: out of code space, evicting all shaders.</span >
and
<span class="quote">&gt;WARNING: value %505 not uniquely defined
&gt;WARNING: value %440 not uniquely defined
&gt;WARNING: value %503 not uniquely defined
&gt;...</span >

Trace (uncompressed 350 MB):
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tOOWhES3ZJaGlHeXc">https://drive.google.com/open?id=0B-tTbLKBl-tOOWhES3ZJaGlHeXc</a>

Fedora 22 32-bit
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Kernel 4.0.6-300.fc22.i686+PAE
libdrm, nouveau ddx, Mesa from git</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436202119.F6FFf0b0.5997--

--===============1139421270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1139421270==--

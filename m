From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86650] New: (NV44): initrd gpu lockup from 3.12 or
	3.13 onwards
Date: Mon, 24 Nov 2014 05:11:36 +0000
Message-ID: <bug-86650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1631813550=="
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


--===============1631813550==
Content-Type: multipart/alternative; boundary="1416805896.6E077D0.20976"; charset="UTF-8"


--1416805896.6E077D0.20976
Date: Mon, 24 Nov 2014 05:11:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86650

            Bug ID: 86650
           Summary: (NV44): initrd gpu lockup from 3.12 or 3.13 onwards
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sebastian-+7HhuH9B2PG2Zizt6A3wSA@public.gmane.org

Created attachment 109919
  --> https://bugs.freedesktop.org/attachment.cgi?id=109919&action=edit
complete dmesg from 3.18-rc4

all kernels since 3.13 immidiatly print this while loading the initrd: (copied
by hand)

-----------------------------------------------------
BUG: recent printk recursion!
E[ DRM] GPU lockup - switching to software fbcon
-----------------------------------------------------

this of course means X wont come up. the last working kernel seems to be 3.11.
i've tested 3.13, 3.15, 3.16, 3.17 and 3.18-rc4 which all show this behaviour.
i couldn't find a 3.12 kernel rpm so i did not test 3.12.

i am using opensuse 13.2 + factory. according to suse they do not patch noveau
and it's the same with the vanilla (unchanged) kernels provided by opensuse.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416805896.6E077D0.20976
Date: Mon, 24 Nov 2014 05:11:36 +0000
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
   title="NEW - (NV44): initrd gpu lockup from 3.12 or 3.13 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86650">86650</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>(NV44): initrd gpu lockup from 3.12 or 3.13 onwards
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>sebastian&#64;prohtmeyhet.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109919" name="attach_109919" title="complete dmesg from 3.18-rc4">attachment 109919</a> <a href="attachment.cgi?id=109919&amp;action=edit" title="complete dmesg from 3.18-rc4">[details]</a></span>
complete dmesg from 3.18-rc4

all kernels since 3.13 immidiatly print this while loading the initrd: (copied
by hand)

-----------------------------------------------------
BUG: recent printk recursion!
E[ DRM] GPU lockup - switching to software fbcon
-----------------------------------------------------

this of course means X wont come up. the last working kernel seems to be 3.11.
i've tested 3.13, 3.15, 3.16, 3.17 and 3.18-rc4 which all show this behaviour.
i couldn't find a 3.12 kernel rpm so i did not test 3.12.

i am using opensuse 13.2 + factory. according to suse they do not patch noveau
and it's the same with the vanilla (unchanged) kernels provided by opensuse.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416805896.6E077D0.20976--

--===============1631813550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1631813550==--

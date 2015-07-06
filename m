From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71900] [NV40] GPU lockup and segmentation fault of
 Nouveau-1.0.10 on PowerMac G5 with acceleration
Date: Mon, 06 Jul 2015 01:47:33 +0000
Message-ID: <bug-71900-8800-NflqCVBnYs@http.bugs.freedesktop.org/>
References: <bug-71900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0986640257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0986640257==
Content-Type: multipart/alternative; boundary="1436147253.cE46A2.32520"; charset="UTF-8"


--1436147253.cE46A2.32520
Date: Mon, 6 Jul 2015 01:47:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71900

--- Comment #9 from Brock Wittrock <brockwittrock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Is there any update on this bug/issue with pagesize issues on 64-bit PowerPC
and the nouveau driver?  I assume now as this is still marked as open, but
thought I would ask anyways. I've been able to partly get the driver working by
using a kernel with 4kb page sizes and MSI interrupts disabled on Debian
Jessie.

I'll try to download, install, and build the latest nouveau driver to see if
there are any changes.  

Also, I do see this is marked as a to-do on under DRM on the nouveau website. 
I can provide any sort of output/logs necessary. Just wanted to try and revive
this somehow.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436147253.cE46A2.32520
Date: Mon, 6 Jul 2015 01:47:33 +0000
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
   title="NEW - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900">bug 71900</a>
              from <span class="vcard"><a class="email" href="mailto:brockwittrock&#64;gmail.com" title="Brock Wittrock &lt;brockwittrock&#64;gmail.com&gt;"> <span class="fn">Brock Wittrock</span></a>
</span></b>
        <pre>Is there any update on this bug/issue with pagesize issues on 64-bit PowerPC
and the nouveau driver?  I assume now as this is still marked as open, but
thought I would ask anyways. I've been able to partly get the driver working by
using a kernel with 4kb page sizes and MSI interrupts disabled on Debian
Jessie.

I'll try to download, install, and build the latest nouveau driver to see if
there are any changes.  

Also, I do see this is marked as a to-do on under DRM on the nouveau website. 
I can provide any sort of output/logs necessary. Just wanted to try and revive
this somehow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436147253.cE46A2.32520--

--===============0986640257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0986640257==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Thu, 05 Feb 2015 15:07:26 +0000
Message-ID: <bug-88868-8800-HCfv29EFtO@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0232174963=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0232174963==
Content-Type: multipart/alternative; boundary="1423148846.fAcBC1.8240"; charset="UTF-8"


--1423148846.fAcBC1.8240
Date: Thu, 5 Feb 2015 15:07:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #24 from Dmitriy <oboturoff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 113202
  --> https://bugs.freedesktop.org/attachment.cgi?id=113202&action=edit
fragment of my fdt

Ben, help me please with the code.

I don't ask you to create the patch. Please give me only comments to your code.

There is the following line in your code (bios/base.c):

data = of_get_property(dn, "NVDA,BMP", &size);

As I understand there is the operation for "NVDA" searching on flat device tree
file.

I haven't this field in my fdt. Tell me please how should it look like? I can'
t find any example in internet.

As I understand my card cannot be initialized because of the missing of this
field.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423148846.fAcBC1.8240
Date: Thu, 5 Feb 2015 15:07:26 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:oboturoff&#64;gmail.com" title="Dmitriy &lt;oboturoff&#64;gmail.com&gt;"> <span class="fn">Dmitriy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=113202" name="attach_113202" title="fragment of my fdt">attachment 113202</a> <a href="attachment.cgi?id=113202&amp;action=edit" title="fragment of my fdt">[details]</a></span>
fragment of my fdt

Ben, help me please with the code.

I don't ask you to create the patch. Please give me only comments to your code.

There is the following line in your code (bios/base.c):

data = of_get_property(dn, &quot;NVDA,BMP&quot;, &amp;size);

As I understand there is the operation for &quot;NVDA&quot; searching on flat device tree
file.

I haven't this field in my fdt. Tell me please how should it look like? I can'
t find any example in internet.

As I understand my card cannot be initialized because of the missing of this
field.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423148846.fAcBC1.8240--

--===============0232174963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0232174963==--

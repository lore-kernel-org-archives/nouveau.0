From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Wed, 18 Mar 2015 19:20:49 +0000
Message-ID: <bug-89664-8800-KNtQ3L5EU8@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877583717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1877583717==
Content-Type: multipart/alternative; boundary="1426706448.cC2eC1.6255"; charset="UTF-8"


--1426706448.cC2eC1.6255
Date: Wed, 18 Mar 2015 19:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89664

--- Comment #1 from Omar <Omar.networkhosting-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 114449
  --> https://bugs.freedesktop.org/attachment.cgi?id=114449&action=edit
VBIOS file

VBIOS retrieved from using:
echo 1 > /sys/bus/pci/devices/<pciid>/rom; cat /sys/bus/pci/devices/<pciid>/rom
> vbios.rom; echo 0 > /sys/bus/pci/devices/<pciid>/rom


Original BIOS installation files can be found here:
http://www.gigabyte.com/products/product-page.aspx?pid=5209#bios

My card uses the F13 Bios.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426706448.cC2eC1.6255
Date: Wed, 18 Mar 2015 19:20:48 +0000
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
   title="NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GTX970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89664#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GTX970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89664">bug 89664</a>
              from <span class="vcard"><a class="email" href="mailto:Omar.networkhosting&#64;gmail.com" title="Omar &lt;Omar.networkhosting&#64;gmail.com&gt;"> <span class="fn">Omar</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114449" name="attach_114449" title="VBIOS file">attachment 114449</a> <a href="attachment.cgi?id=114449&amp;action=edit" title="VBIOS file">[details]</a></span>
VBIOS file

VBIOS retrieved from using:
echo 1 &gt; /sys/bus/pci/devices/&lt;pciid&gt;/rom; cat /sys/bus/pci/devices/&lt;pciid&gt;/rom
<span class="quote">&gt; vbios.rom; echo 0 &gt; /sys/bus/pci/devices/&lt;pciid&gt;/rom</span >


Original BIOS installation files can be found here:
<a href="http://www.gigabyte.com/products/product-page.aspx?pid=5209#bios">http://www.gigabyte.com/products/product-page.aspx?pid=5209#bios</a>

My card uses the F13 Bios.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426706448.cC2eC1.6255--

--===============1877583717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1877583717==--

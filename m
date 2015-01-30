From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Fri, 30 Jan 2015 01:05:48 +0000
Message-ID: <bug-88868-8800-zxI6oFJ4M2@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591729433=="
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


--===============0591729433==
Content-Type: multipart/alternative; boundary="1422579948.8f084AAF1.18758"; charset="UTF-8"


--1422579948.8f084AAF1.18758
Date: Fri, 30 Jan 2015 01:05:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Dmitriy from comment #8)
> ) Thank you very much for your answer.
> 
> I spent a lot of time to get out how the driver works. Yes, powerpc e5500 it
> is BE arch. Of course byteswaps can be the reason of error but I think it
> isn't in this case.

[fwiw, ppc le is becoming a thing]

> 
>  Could you please clearify two moments. And I'll try to find the problem by
> myself.
> 1.Why does the variable "boot" have byteswap but the variable "strap" has
> the correct value?

I don't see anywhere in your kernel log where boot0 is correct. (boot0 is mmio
register 0)

> 2.Why can't the driver read on the address 0x700000 and 0x700001?

Probably because it doesn't do the

        if (device->card_type >= NV_50)

bits which set up instmem to point to the right place. 0x700000 isn't some
magical thing... it's a view into vram, and it doesn't get set up because the
card gets detected as a NV1A which is *considerably* different from NVD9.
(pre-nv50 I think vram always fit into the 0x700000 range so the prefix wasn't
a thing... or something.)

> 
> Please tell me what first steps should I take to find out how to correct the
> error.

In case Ben's patch doesn't fix it, try to figure out what's going on. Until
boot0 is read out properly, you can ignore any of the later failures.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422579948.8f084AAF1.18758
Date: Fri, 30 Jan 2015 01:05:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href="show_bug.cgi?id=88868#c8">comment #8</a>)
<span class="quote">&gt; ) Thank you very much for your answer.
&gt; 
&gt; I spent a lot of time to get out how the driver works. Yes, powerpc e5500 it
&gt; is BE arch. Of course byteswaps can be the reason of error but I think it
&gt; isn't in this case.</span >

[fwiw, ppc le is becoming a thing]

<span class="quote">&gt; 
&gt;  Could you please clearify two moments. And I'll try to find the problem by
&gt; myself.
&gt; 1.Why does the variable &quot;boot&quot; have byteswap but the variable &quot;strap&quot; has
&gt; the correct value?</span >

I don't see anywhere in your kernel log where boot0 is correct. (boot0 is mmio
register 0)

<span class="quote">&gt; 2.Why can't the driver read on the address 0x700000 and 0x700001?</span >

Probably because it doesn't do the

        if (device-&gt;card_type &gt;= NV_50)

bits which set up instmem to point to the right place. 0x700000 isn't some
magical thing... it's a view into vram, and it doesn't get set up because the
card gets detected as a NV1A which is *considerably* different from NVD9.
(pre-nv50 I think vram always fit into the 0x700000 range so the prefix wasn't
a thing... or something.)

<span class="quote">&gt; 
&gt; Please tell me what first steps should I take to find out how to correct the
&gt; error.</span >

In case Ben's patch doesn't fix it, try to figure out what's going on. Until
boot0 is read out properly, you can ignore any of the later failures.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422579948.8f084AAF1.18758--

--===============0591729433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0591729433==--

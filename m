From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Tue, 03 Feb 2015 23:41:47 +0000
Message-ID: <bug-88868-8800-T76iXjmcFi@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0492554472=="
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


--===============0492554472==
Content-Type: multipart/alternative; boundary="1423006907.F7eb581.22133"; charset="UTF-8"


--1423006907.F7eb581.22133
Date: Tue, 3 Feb 2015 23:41:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #22 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Dmitriy from comment #21)
> [...]
> 
> result of operation:
> addr = nv_rd32(bios, 0x619f04);
> 
> for x86: addr=3ffe09
> for ppc: addr0=1
> 
> Why do the results of reading operation differ from each other?
I believe Ben already answered that one, but perhaps it's not that obvious if
one does not have experience with nouveau.

The PRAMIN region (in this context) is the last 1MiB or VRAM. As the card is
POSTed/initialised the VBIOS is copied in that region. As you can see on x86
your card is initialised, unlike on PPC.


Regarding your earlier question(s) (despite that I'm not Ben)

> 1. Is there any possibility that you will create a new patch which will support
> GT610 or GT520?
I doubt that only a single patch will do the job. Afaict there as need (close
to) 0 work done understanding what needs to be done, let alone writing the
patch(es).

> 2. What do you think, is it possible that I will solve the problem by myself
> and create the patch by myself?
No offence/disrespect, but I think you are underestimating how deep the waters
are(could be). Even if on the nouveau side everything is fixed, there has been
a few issues in mesa (as pointed by Ilia) wrt big endian machines, which afaict
are not resolved.

Maybe you can take a look and fix (if needed) the software rendering on BE
machines. That should cover some of the mesa bits :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423006907.F7eb581.22133
Date: Tue, 3 Feb 2015 23:41:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href="show_bug.cgi?id=88868#c21">comment #21</a>)
<span class="quote">&gt; [...]
&gt; 
&gt; result of operation:
&gt; addr = nv_rd32(bios, 0x619f04);
&gt; 
&gt; for x86: addr=3ffe09
&gt; for ppc: addr0=1
&gt; 
&gt; Why do the results of reading operation differ from each other?</span >
I believe Ben already answered that one, but perhaps it's not that obvious if
one does not have experience with nouveau.

The PRAMIN region (in this context) is the last 1MiB or VRAM. As the card is
POSTed/initialised the VBIOS is copied in that region. As you can see on x86
your card is initialised, unlike on PPC.


Regarding your earlier question(s) (despite that I'm not Ben)

<span class="quote">&gt; 1. Is there any possibility that you will create a new patch which will support
&gt; GT610 or GT520?</span >
I doubt that only a single patch will do the job. Afaict there as need (close
to) 0 work done understanding what needs to be done, let alone writing the
patch(es).

<span class="quote">&gt; 2. What do you think, is it possible that I will solve the problem by myself
&gt; and create the patch by myself?</span >
No offence/disrespect, but I think you are underestimating how deep the waters
are(could be). Even if on the nouveau side everything is fixed, there has been
a few issues in mesa (as pointed by Ilia) wrt big endian machines, which afaict
are not resolved.

Maybe you can take a look and fix (if needed) the software rendering on BE
machines. That should cover some of the mesa bits :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423006907.F7eb581.22133--

--===============0492554472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0492554472==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Fri, 01 Apr 2016 13:04:57 +0000
Message-ID: <bug-94725-8800-nPupLMYY4H@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0409491502=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0409491502==
Content-Type: multipart/alternative; boundary="14595158971.C2F6D2CA.28993";
 charset="UTF-8"


--14595158971.C2F6D2CA.28993
Date: Fri, 1 Apr 2016 13:04:57 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #12 from Efrem McCrimon <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I will not be able to test until later this afternoon. I have a GTX 960 as
PCI 01:00.0 and GTX 730 as PCI 02:00.0.
I will send over dmesg/journalctl -k.

Regards
Efrem
On Apr 1, 2016 4:02 AM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 11 <https://bugs.freedesktop.org/show_bug.cgi?id=94725#c11> on
> bug 94725 <https://bugs.freedesktop.org/show_bug.cgi?id=94725> from
> Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> *
>
> Thanks Rashed. This looks better but something seems to be going wrong with
> PCI. I'm pretty clueless about PCI/ACPI, so let's see if someone else has
> something to suggest...
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14595158971.C2F6D2CA.28993
Date: Fri, 1 Apr 2016 13:04:57 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:efremmc2&#64;gmail.com" title="Efrem McCrimon &lt;efremmc2&#64;gmail.com&gt;"> <span class="fn">Efrem McCrimon</span></a>
</span></b>
        <pre>I will not be able to test until later this afternoon. I have a GTX 960 as
PCI 01:00.0 and GTX 730 as PCI 02:00.0.
I will send over dmesg/journalctl -k.

Regards
Efrem
On Apr 1, 2016 4:02 AM, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class="quote">&gt; *<a href="show_bug.cgi?id=94725#c11">Comment # 11</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725#c11">https://bugs.freedesktop.org/show_bug.cgi?id=94725#c11</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725">bug 94725</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="show_bug.cgi?id=94725">https://bugs.freedesktop.org/show_bug.cgi?id=94725</a>&gt; from
&gt; Alexandre Courbot &lt;<a href="mailto:gnurou&#64;gmail.com">gnurou&#64;gmail.com</a>&gt; *</span >
&gt;
<span class="quote">&gt; Thanks Rashed. This looks better but something seems to be going wrong with
&gt; PCI. I'm pretty clueless about PCI/ACPI, so let's see if someone else has
&gt; something to suggest...</span >
&gt;
<span class="quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class="quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href="mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists.freedesktop.org</a>
&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14595158971.C2F6D2CA.28993--

--===============0409491502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0409491502==--

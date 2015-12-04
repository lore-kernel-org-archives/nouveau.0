From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8] KDE Plasma locks up: Nouveau reports
 error "resource sanity check" "unable to handle kernel paging request"
Date: Fri, 04 Dec 2015 16:12:57 +0000
Message-ID: <bug-92892-8800-rknqkczJo5@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741636396=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92892-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1741636396==
Content-Type: multipart/alternative; boundary="1449245576.BbEfC0bb1.24891"; charset="UTF-8"


--1449245576.BbEfC0bb1.24891
Date: Fri, 4 Dec 2015 16:12:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #11 from Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> ---
(In reply to doktor.yak from comment #10)
> Thanks for your answer.
> 
> Do you know if Suse did apply any patch on their version of the 4.2.4 kernel
> ?

Nothing about nouveau.

> Otherwise I'll follow your recommendation and compile a vanilla kernel.
> (with "make oldconfig"-ing /proc/config.gz)

It's anyway better to compile by yourself for excluding any subtle differences.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449245576.BbEfC0bb1.24891
Date: Fri, 4 Dec 2015 16:12:56 +0000
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
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:tiwai&#64;suse.de" title="Takashi Iwai &lt;tiwai&#64;suse.de&gt;"> <span class="fn">Takashi Iwai</span></a>
</span></b>
        <pre>(In reply to doktor.yak from <a href="show_bug.cgi?id=92892#c10">comment #10</a>)
<span class="quote">&gt; Thanks for your answer.
&gt; 
&gt; Do you know if Suse did apply any patch on their version of the 4.2.4 kernel
&gt; ?</span >

Nothing about nouveau.

<span class="quote">&gt; Otherwise I'll follow your recommendation and compile a vanilla kernel.
&gt; (with &quot;make oldconfig&quot;-ing /proc/config.gz)</span >

It's anyway better to compile by yourself for excluding any subtle differences.</pre>
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

--1449245576.BbEfC0bb1.24891--

--===============1741636396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1741636396==--

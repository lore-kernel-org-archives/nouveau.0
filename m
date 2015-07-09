From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90513] Odd gray and red flicker in The Talos
	Principle on GK104
Date: Thu, 09 Jul 2015 18:34:41 +0000
Message-ID: <bug-90513-8800-oIEDR3JH2w@http.bugs.freedesktop.org/>
References: <bug-90513-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716296019=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90513-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1716296019==
Content-Type: multipart/alternative; boundary="1436466880.8c02fC3F1.24023"; charset="UTF-8"


--1436466880.8c02fC3F1.24023
Date: Thu, 9 Jul 2015 18:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90513

--- Comment #7 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> I've made no progress on this bug BTW; perhaps an avenue would be to
> generate a super-low-resolution trace (i.e. minimum supported by the game...
> 320x200 or 640x480 or something) so that it plays back faster, and with the
> minimum number of "features" enabled to make the problem happen.
> 
> Basically right now every run through glretrace is a minute or longer, which
> is too painful to analyze the draws. And I think I gave up waiting for
> llvmpipe.

in the trace I gave you
(https://www.dropbox.com/s/hiwgrf4i6kw5aue/talos.trace.xz?dl=0)

frame 1166 call 1710787 draws the faulty wall into the buffer

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436466880.8c02fC3F1.24023
Date: Thu, 9 Jul 2015 18:34:40 +0000
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
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513">bug 90513</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90513#c5">comment #5</a>)
<span class="quote">&gt; I've made no progress on this bug BTW; perhaps an avenue would be to
&gt; generate a super-low-resolution trace (i.e. minimum supported by the game...
&gt; 320x200 or 640x480 or something) so that it plays back faster, and with the
&gt; minimum number of &quot;features&quot; enabled to make the problem happen.
&gt; 
&gt; Basically right now every run through glretrace is a minute or longer, which
&gt; is too painful to analyze the draws. And I think I gave up waiting for
&gt; llvmpipe.</span >

in the trace I gave you
(<a href="https://www.dropbox.com/s/hiwgrf4i6kw5aue/talos.trace.xz?dl=0">https://www.dropbox.com/s/hiwgrf4i6kw5aue/talos.trace.xz?dl=0</a>)

frame 1166 call 1710787 draws the faulty wall into the buffer</pre>
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

--1436466880.8c02fC3F1.24023--

--===============1716296019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1716296019==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Mon, 17 Feb 2014 20:52:32 +0000
Message-ID: <bug-33165-8800-7JvQ6rJ0ju@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2079874909=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2079874909==
Content-Type: multipart/alternative; boundary="1392670353.decECcbe5.26738"; charset="us-ascii"


--1392670353.decECcbe5.26738
Date: Mon, 17 Feb 2014 20:52:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33165

--- Comment #25 from Oleg Bulatov <oleg-BA2faJl1U0oSAix4rjypdw@public.gmane.org> ---
Still present in 3.13.2-gentoo. I found that -EBUSY returns from
nv50_fbcon_imageblit.

> what is wrong in nouveau's way of setting up pgraph.
Does it mean that the bug somewhere in nv50_grctx_generate? Just to be sure
that bug in this function, is it possible to replace it using data from
mmiotrace of nvidia driver? For me it is not obvious how to modificate
nv50_grctx_fill in that case, what nv50_grctx_init should write to *size and,
after all, may it help somehow?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392670353.decECcbe5.26738
Date: Mon, 17 Feb 2014 20:52:33 +0000
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
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165">bug 33165</a>
              from <span class="vcard"><a class="email" href="mailto:oleg&#64;bulatov.mobi" title="Oleg Bulatov &lt;oleg&#64;bulatov.mobi&gt;"> <span class="fn">Oleg Bulatov</span></a>
</span></b>
        <pre>Still present in 3.13.2-gentoo. I found that -EBUSY returns from
nv50_fbcon_imageblit.

<span class="quote">&gt; what is wrong in nouveau's way of setting up pgraph.</span >
Does it mean that the bug somewhere in nv50_grctx_generate? Just to be sure
that bug in this function, is it possible to replace it using data from
mmiotrace of nvidia driver? For me it is not obvious how to modificate
nv50_grctx_fill in that case, what nv50_grctx_init should write to *size and,
after all, may it help somehow?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392670353.decECcbe5.26738--

--===============2079874909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2079874909==--

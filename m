From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61287] (bisected) kernel>=3.7 breaks nouveau with
 acceleration for GeForce 6150SE nForce 430
Date: Wed, 07 Aug 2013 08:24:36 +0000
Message-ID: <bug-61287-8800-vKOBIkCF82@http.bugs.freedesktop.org/>
References: <bug-61287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160303746=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61287-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1160303746==
Content-Type: multipart/alternative; boundary="1375863875.EB16a1.9940"; charset="us-ascii"


--1375863875.EB16a1.9940
Date: Wed, 7 Aug 2013 08:24:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61287

--- Comment #10 from gabriele balducci <balducci-KqplAB4qOuE@public.gmane.org> ---
hello,
I am presently away from the machine which I reported the problem for and
playing with remote reboots is too risky for me at the moment.

However: for me the problem apparently went away somewhere in the 3.8.x or
early 3.9.x window: at present (3.10.5) acceleration does work (only the vmd
molecular visualization code seems to have problems with recent (>=9.1.x) mesa)

Looking into my logs, I am pretty sure I tried this nouveau.config=NvPCIE=0
kernel opt, but with no success.

I remark that, at present, the GPU seems to work fine with acceleration
enabled: glxgears runs without problems and so is for vmd (with the mesa
limitation mentioned above)

This makes me think that the problem reported by georgy for the different GPU
might be actually different.

Also, frank: you are running the same GPU: did you try a recent (3.10.x)
kernel?

Unfortunately, I am not able to say exactly WHICH kernel version did the trick
for me: I can try booting old kernels until I reproduce the problem, if that
can be of any use. But I can do this only on monday next week

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375863875.EB16a1.9940
Date: Wed, 7 Aug 2013 08:24:35 +0000
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
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287">bug 61287</a>
              from <span class="vcard"><a class="email" href="mailto:balducci&#64;units.it" title="gabriele balducci &lt;balducci&#64;units.it&gt;"> <span class="fn">gabriele balducci</span></a>
</span></b>
        <pre>hello,
I am presently away from the machine which I reported the problem for and
playing with remote reboots is too risky for me at the moment.

However: for me the problem apparently went away somewhere in the 3.8.x or
early 3.9.x window: at present (3.10.5) acceleration does work (only the vmd
molecular visualization code seems to have problems with recent (&gt;=9.1.x) mesa)

Looking into my logs, I am pretty sure I tried this nouveau.config=NvPCIE=0
kernel opt, but with no success.

I remark that, at present, the GPU seems to work fine with acceleration
enabled: glxgears runs without problems and so is for vmd (with the mesa
limitation mentioned above)

This makes me think that the problem reported by georgy for the different GPU
might be actually different.

Also, frank: you are running the same GPU: did you try a recent (3.10.x)
kernel?

Unfortunately, I am not able to say exactly WHICH kernel version did the trick
for me: I can try booting old kernels until I reproduce the problem, if that
can be of any use. But I can do this only on monday next week

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375863875.EB16a1.9940--

--===============1160303746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1160303746==--

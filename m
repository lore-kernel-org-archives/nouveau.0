From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Sat, 05 Jan 2013 14:56:19 +0000
Message-ID: <bug-50121-8800-xnKazWwWf1@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2125895162=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2125895162==
Content-Type: multipart/alternative; boundary="1357397779.d4cBD5bd4.21063"; charset="us-ascii"


--1357397779.d4cBD5bd4.21063
Date: Sat, 5 Jan 2013 14:56:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #51 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #50)
> Maybe you can send a patch to Fedora? Maybe they will happily backport it
> for you. Especially since they try to be bleeding edge and all...
I would have if I knew how to fix it and make it work, since I assumed the
changes will be ... (ahem) quite "trivial".

As it turns out, they aren't and my knowledge of this driver's inner workings
isn't enough for me to re-create the patch for 3.6, which, incidentally, is
still the latest mainstream-supported kernel by my distro. 

Ben Skeggs, who is responsible for the nvidia branch at Fedora (and who also
appears listed in this bug) could do that - whether he chooses to is up to him,
though given my past experiences with nvidia team @Fedora, I am not holding my
breath.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357397779.d4cBD5bd4.21063
Date: Sat, 5 Jan 2013 14:56:19 +0000
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
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c51">Comment # 51</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c50">comment #50</a>)
<span class="quote">&gt; Maybe you can send a patch to Fedora? Maybe they will happily backport it
&gt; for you. Especially since they try to be bleeding edge and all...</span >
I would have if I knew how to fix it and make it work, since I assumed the
changes will be ... (ahem) quite &quot;trivial&quot;.

As it turns out, they aren't and my knowledge of this driver's inner workings
isn't enough for me to re-create the patch for 3.6, which, incidentally, is
still the latest mainstream-supported kernel by my distro. 

Ben Skeggs, who is responsible for the nvidia branch at Fedora (and who also
appears listed in this bug) could do that - whether he chooses to is up to him,
though given my past experiences with nvidia team &#64;Fedora, I am not holding my
breath.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357397779.d4cBD5bd4.21063--

--===============2125895162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2125895162==--

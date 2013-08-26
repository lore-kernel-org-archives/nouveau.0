From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32855] Incorrect image stretching with Render in
 RepeatPad mode, NV50
Date: Mon, 26 Aug 2013 18:59:38 +0000
Message-ID: <bug-32855-8800-ZvAiyK9AoX@http.bugs.freedesktop.org/>
References: <bug-32855-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0084241560=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32855-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0084241560==
Content-Type: multipart/alternative; boundary="1377543578.CF0a2.18867"; charset="us-ascii"


--1377543578.CF0a2.18867
Date: Mon, 26 Aug 2013 18:59:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=32855

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #9)
> It is user-hostile and unprofessional to mass-close bugs, even very old
> bugs, without making any attempt to reproduce the problem first. 
> http://www.jwz.org/doc/cadt.html

I wasn't a big fan of it either (despite proposing it and doing it). But look
at it from the project's standpoint -- volunteer based (and not exactly a big
team), high code churn rate (esp 1-2 years ago), high hardware
death(/replacement) rate, large variety of hardware, 400+ bugs deep, of which
200 are from more than 2 years without an update. So I didn't see a better way
of getting a handle on the situation. Of the 200+ bugs I closed, about 10 have
gotten follow-up comments of any sort (either that it's been fixed/hardware
gone/still a problem). I'm individually pinging newer bugs, and I'm not having
a great response rate either (but better).

Besides, you always have the option of re-opening the same bug and providing
updated information. As a bug filer, I think it's reasonable to expect you to
be the main tester (at least with nouveau).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377543578.CF0a2.18867
Date: Mon, 26 Aug 2013 18:59:38 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - Incorrect image stretching with Render in RepeatPad mode, NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32855#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - Incorrect image stretching with Render in RepeatPad mode, NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32855">bug 32855</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=32855#c9">comment #9</a>)
<span class="quote">&gt; It is user-hostile and unprofessional to mass-close bugs, even very old
&gt; bugs, without making any attempt to reproduce the problem first. 
&gt; <a href="http://www.jwz.org/doc/cadt.html">http://www.jwz.org/doc/cadt.html</a></span >

I wasn't a big fan of it either (despite proposing it and doing it). But look
at it from the project's standpoint -- volunteer based (and not exactly a big
team), high code churn rate (esp 1-2 years ago), high hardware
death(/replacement) rate, large variety of hardware, 400+ bugs deep, of which
200 are from more than 2 years without an update. So I didn't see a better way
of getting a handle on the situation. Of the 200+ bugs I closed, about 10 have
gotten follow-up comments of any sort (either that it's been fixed/hardware
gone/still a problem). I'm individually pinging newer bugs, and I'm not having
a great response rate either (but better).

Besides, you always have the option of re-opening the same bug and providing
updated information. As a bug filer, I think it's reasonable to expect you to
be the main tester (at least with nouveau).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377543578.CF0a2.18867--

--===============0084241560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0084241560==--

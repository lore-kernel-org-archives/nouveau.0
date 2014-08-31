From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83168] [NV46] No display after suspend to RAM
Date: Sun, 31 Aug 2014 22:49:47 +0000
Message-ID: <bug-83168-8800-vIM3mcyVTC@http.bugs.freedesktop.org/>
References: <bug-83168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2063980276=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2063980276==
Content-Type: multipart/alternative; boundary="1409525387.a1dad55F1.18352"; charset="us-ascii"


--1409525387.a1dad55F1.18352
Date: Sun, 31 Aug 2014 22:49:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83168

--- Comment #9 from Neven Sajko <nsajko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I built and installed linux 3.2 and it also didn't give a display after
suspend.
I took a kernel log again while the display didn't work, and it seems that
Nouveau didn't make any errors!? I'll upload it as linux3.2_log.txt.
Maybe I should try installing some stock, current distro to see if the problem
is present there too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409525387.a1dad55F1.18352
Date: Sun, 31 Aug 2014 22:49:47 +0000
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
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168">bug 83168</a>
              from <span class="vcard"><a class="email" href="mailto:nsajko&#64;gmail.com" title="Neven Sajko &lt;nsajko&#64;gmail.com&gt;"> <span class="fn">Neven Sajko</span></a>
</span></b>
        <pre>I built and installed linux 3.2 and it also didn't give a display after
suspend.
I took a kernel log again while the display didn't work, and it seems that
Nouveau didn't make any errors!? I'll upload it as linux3.2_log.txt.
Maybe I should try installing some stock, current distro to see if the problem
is present there too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409525387.a1dad55F1.18352--

--===============2063980276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2063980276==--

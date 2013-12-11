From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Wed, 11 Dec 2013 15:02:02 +0000
Message-ID: <bug-54700-8800-2Y3GhQ2IVF@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0043195501=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0043195501==
Content-Type: multipart/alternative; boundary="1386774122.D1433.7849"; charset="us-ascii"


--1386774122.D1433.7849
Date: Wed, 11 Dec 2013 15:02:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #53 from Emgaron <emgaron+freedesktop-l5GFkHDWBBlg9hUCZPvPmw@public.gmane.org> ---
I just discovered this bug as I acquired a Dell Inspiron 8500 a few weeks back
and ran into the same problem. In fact, on my machine (same nVidia graphics),
the problem even seems worse: Any attempt at using the nouveau driver so far
has not only produced the distortions described by the original poster, but
also ended with a GPU lock-up after a few minutes maximum. For that reason, I'm
now running Xubuntu 12.04 on that machine, as this distribution still provides
the older nvidia-96 proprietary driver - newer distros apparently dropped this
version. With the proprietary driver, the laptop runs fine and actually quite
smooth (considering the age and specs). As it would be nice to be able to run
newer Linux distros on this machine, I'd be happy to help with
experimenting/testing. I could install a newer distro (and hence - presumably -
newer nouveau driver) on a second hard drive or on an external drive so I can
test stuff. Any preferences which distro would be most helpful for you?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386774122.D1433.7849
Date: Wed, 11 Dec 2013 15:02:02 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c53">Comment # 53</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emgaron+freedesktop&#64;ribbrock.org" title="Emgaron &lt;emgaron+freedesktop&#64;ribbrock.org&gt;"> <span class="fn">Emgaron</span></a>
</span></b>
        <pre>I just discovered this bug as I acquired a Dell Inspiron 8500 a few weeks back
and ran into the same problem. In fact, on my machine (same nVidia graphics),
the problem even seems worse: Any attempt at using the nouveau driver so far
has not only produced the distortions described by the original poster, but
also ended with a GPU lock-up after a few minutes maximum. For that reason, I'm
now running Xubuntu 12.04 on that machine, as this distribution still provides
the older nvidia-96 proprietary driver - newer distros apparently dropped this
version. With the proprietary driver, the laptop runs fine and actually quite
smooth (considering the age and specs). As it would be nice to be able to run
newer Linux distros on this machine, I'd be happy to help with
experimenting/testing. I could install a newer distro (and hence - presumably -
newer nouveau driver) on a second hard drive or on an external drive so I can
test stuff. Any preferences which distro would be most helpful for you?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386774122.D1433.7849--

--===============0043195501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0043195501==--

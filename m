From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Tue, 07 Jan 2014 16:33:36 +0000
Message-ID: <bug-68835-8800-X5ieDOEpdT@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0159541840=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0159541840==
Content-Type: multipart/alternative; boundary="1389112415.8b1B1.8560"; charset="us-ascii"


--1389112415.8b1B1.8560
Date: Tue, 7 Jan 2014 16:33:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #9 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Hi Ilia,
honestly I don't know if I could test this within a week or so, because I would
need to make a Fedora installation on a new disk/partition, sort out how to
build a custom kernel with patched nouveau and test it (I've never done this
before, maybe something like that ages ago on a Slackware 4 distribution...
:-P). In fact, the tests I made were on a live Fedore 19, because the actual
installed distribution I'm currently using on this system is an OpenMediaVault
(based on Debian Squeeze), which is too old to try this.

I can afford this, but I can't bet on the time I will need.

If you feel safe to check it in anyway, I will surely test a live distribution
with the new kernel as soon as it will become available (or, in the mean time,
I may be able to do all the steps needed to test this patch on Fedora 19...).
By the way, if you check it in now, which new Linux kernel version do you
expect to inherit the fix?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389112415.8b1B1.8560
Date: Tue, 7 Jan 2014 16:33:35 +0000
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
   title="NEW --- - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Hi Ilia,
honestly I don't know if I could test this within a week or so, because I would
need to make a Fedora installation on a new disk/partition, sort out how to
build a custom kernel with patched nouveau and test it (I've never done this
before, maybe something like that ages ago on a Slackware 4 distribution...
:-P). In fact, the tests I made were on a live Fedore 19, because the actual
installed distribution I'm currently using on this system is an OpenMediaVault
(based on Debian Squeeze), which is too old to try this.

I can afford this, but I can't bet on the time I will need.

If you feel safe to check it in anyway, I will surely test a live distribution
with the new kernel as soon as it will become available (or, in the mean time,
I may be able to do all the steps needed to test this patch on Fedora 19...).
By the way, if you check it in now, which new Linux kernel version do you
expect to inherit the fix?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389112415.8b1B1.8560--

--===============0159541840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0159541840==--

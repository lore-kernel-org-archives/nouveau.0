From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] optimus don't use nouveau card
Date: Wed, 14 Aug 2013 23:29:23 +0000
Message-ID: <bug-64746-8800-alMhPW0x6T@http.bugs.freedesktop.org/>
References: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1474760882=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64746-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1474760882==
Content-Type: multipart/alternative; boundary="1376522962.0807c5620.19029"; charset="us-ascii"


--1376522962.0807c5620.19029
Date: Wed, 14 Aug 2013 23:29:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Marc

Can you attach your xorg.log, the link provided returns a 404

What is the output of
$ DRI_PRIME=1 glxinfo | grep render

Note that Optimus is a very "funny" case and your experience may vary depending
on the connections between the GPUs and the outputs - special thanks goes to
your laptop manufacturer :)

For further information take a look at our wiki [1]
[1] http://nouveau.freedesktop.org/wiki/Optimus/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376522962.0807c5620.19029
Date: Wed, 14 Aug 2013 23:29:22 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">bug 64746</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Marc

Can you attach your xorg.log, the link provided returns a 404

What is the output of
$ DRI_PRIME=1 glxinfo | grep render

Note that Optimus is a very &quot;funny&quot; case and your experience may vary depending
on the connections between the GPUs and the outputs - special thanks goes to
your laptop manufacturer :)

For further information take a look at our wiki [1]
[1] <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376522962.0807c5620.19029--

--===============1474760882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1474760882==--

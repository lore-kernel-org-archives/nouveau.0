From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67597] nouveau E Xorg failed to idle channel on NVA0
Date: Fri, 02 Aug 2013 16:47:26 +0000
Message-ID: <bug-67597-8800-VijmEXkOiG@http.bugs.freedesktop.org/>
References: <bug-67597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1603592035=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1603592035==
Content-Type: multipart/alternative; boundary="1375462046.18fc36C1.15409"; charset="us-ascii"


--1375462046.18fc36C1.15409
Date: Fri, 2 Aug 2013 16:47:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67597

--- Comment #5 from Marc Meledandri <m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks for the info. Unfortunately, it's a CPU hard lockup - no ssh
connectivity and cannot sysrq out safely. Additionally, I've got a raid that
doesn't get synced on this crash, on top of the SSD issue, so this becomes
quite troublesome.

I had reported a similar nouveau crasher via downstream Debian BTS last year.
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=696554

That's why I switched over to XFCE and build my own vanilla 3.4.x kernels +
i2c/pwm patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375462046.18fc36C1.15409
Date: Fri, 2 Aug 2013 16:47:26 +0000
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
   title="NEW --- - nouveau E Xorg failed to idle channel on NVA0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67597#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E Xorg failed to idle channel on NVA0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67597">bug 67597</a>
              from <span class="vcard"><a class="email" href="mailto:m.meledandri&#64;gmail.com" title="Marc Meledandri &lt;m.meledandri&#64;gmail.com&gt;"> <span class="fn">Marc Meledandri</span></a>
</span></b>
        <pre>Thanks for the info. Unfortunately, it's a CPU hard lockup - no ssh
connectivity and cannot sysrq out safely. Additionally, I've got a raid that
doesn't get synced on this crash, on top of the SSD issue, so this becomes
quite troublesome.

I had reported a similar nouveau crasher via downstream Debian BTS last year.
<a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=696554">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=696554</a>

That's why I switched over to XFCE and build my own vanilla 3.4.x kernels +
i2c/pwm patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375462046.18fc36C1.15409--

--===============1603592035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1603592035==--

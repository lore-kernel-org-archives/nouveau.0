From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] DVI monitor connected via HDMI is
 blank / standby (NV96 / 9500GS)
Date: Sun, 25 Aug 2013 05:11:06 +0000
Message-ID: <bug-43939-8800-w9hBJvCyc7@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0527774866=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0527774866==
Content-Type: multipart/alternative; boundary="1377407466.F12153c82.3830"; charset="us-ascii"


--1377407466.F12153c82.3830
Date: Sun, 25 Aug 2013 05:11:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #9 from Anthony Foiani <anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #8)
> I'm downloading the rawhide (f20branch) live media right now, will see if I
> can boot all the way with it.

...

> Ok, live media downloaded, time for a reboot.

No luck with the live media.  I'm using this build of Fedora 20:
http://koji.fedoraproject.org/koji/taskinfo?taskID=5846747

And unfortunately it looks like that includes rc6:
kernel-3.11.0-0.rc6.git2.1.fc20.x86_64.rpm

To be clear, "no luck" means same basic failure: no live screen with HDMI
connection, live screen with dual-link DVI connection.

Even with DVI, this particular live media failed to boot all the way into X,
but I did get the graphical boot logo at full resolution, and the text console
was rendered at full resolution as well.

At this point, I'll have to let it go for a while; that card is in my main
workstation, and I can't afford to do too many experiments with it.

If the current logs still don't give any clues, I might be able to move this
card to an older box for testing, but I'll have to put a new card in my
workstation first.

Sorry I don't have anything more definite for you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377407466.F12153c82.3830
Date: Sun, 25 Aug 2013 05:11:06 +0000
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
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:anthony.foiani+freedesktop&#64;gmail.com" title="Anthony Foiani &lt;anthony.foiani+freedesktop&#64;gmail.com&gt;"> <span class="fn">Anthony Foiani</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=43939#c8">comment #8</a>)
<span class="quote">&gt; I'm downloading the rawhide (f20branch) live media right now, will see if I
&gt; can boot all the way with it.</span >

...

<span class="quote">&gt; Ok, live media downloaded, time for a reboot.</span >

No luck with the live media.  I'm using this build of Fedora 20:
<a href="http://koji.fedoraproject.org/koji/taskinfo?taskID=5846747">http://koji.fedoraproject.org/koji/taskinfo?taskID=5846747</a>

And unfortunately it looks like that includes rc6:
kernel-3.11.0-0.rc6.git2.1.fc20.x86_64.rpm

To be clear, &quot;no luck&quot; means same basic failure: no live screen with HDMI
connection, live screen with dual-link DVI connection.

Even with DVI, this particular live media failed to boot all the way into X,
but I did get the graphical boot logo at full resolution, and the text console
was rendered at full resolution as well.

At this point, I'll have to let it go for a while; that card is in my main
workstation, and I can't afford to do too many experiments with it.

If the current logs still don't give any clues, I might be able to move this
card to an older box for testing, but I'll have to put a new card in my
workstation first.

Sorry I don't have anything more definite for you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377407466.F12153c82.3830--

--===============0527774866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0527774866==--

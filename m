From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 27 Jul 2013 13:43:20 +0000
Message-ID: <bug-67051-8800-3Mhtb8k4E2@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973628670=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0973628670==
Content-Type: multipart/alternative; boundary="1374932599.cD68c84b0.12779"; charset="us-ascii"


--1374932599.cD68c84b0.12779
Date: Sat, 27 Jul 2013 13:43:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #91 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
>> Should I go ahead and compile this commit (despite debug-3 failure)
>> and post the dmesg?
>> Please advise.

> No. My debug patch would have to be redone for a kernel that old. Instead, please take a recent kernel and apply my debug patch to it, and boot. The other patches are actually probably not necessary either -- they just change what gets written where, whereas I'm trying to figure out a potential issue with the execution flow. You don't even have to go into X or test anything (but you can) -- I just want to see the dmesg that happens when nouveau loads with that debug patch. (But obviously make sure that your hdmi-audio-capable device is plugged in at the time.)

Please give me an exact kernel version you'd be comfortable with.
Most likely my Linus copy is already a little old;  OTOH, I can
easily go out and get 3.10.3 (or whatever kernel du jour there might be);  etc.

For dmesg, I assume (but please confirm):

NOUVEAU_DEBUG=7
nouveau.debug=PDISP=spam

For patches:  only dmesg-3? or what else exactly?.

BTW:  Don't worry about X.  I ain't gonna touch it this time :)

Thanks,
-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374932599.cD68c84b0.12779
Date: Sat, 27 Jul 2013 13:43:19 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c91">Comment # 91</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre><span class="quote">&gt;&gt; Should I go ahead and compile this commit (despite debug-3 failure)
&gt;&gt; and post the dmesg?
&gt;&gt; Please advise.</span >

<span class="quote">&gt; No. My debug patch would have to be redone for a kernel that old. Instead, please take a recent kernel and apply my debug patch to it, and boot. The other patches are actually probably not necessary either -- they just change what gets written where, whereas I'm trying to figure out a potential issue with the execution flow. You don't even have to go into X or test anything (but you can) -- I just want to see the dmesg that happens when nouveau loads with that debug patch. (But obviously make sure that your hdmi-audio-capable device is plugged in at the time.)</span >

Please give me an exact kernel version you'd be comfortable with.
Most likely my Linus copy is already a little old;  OTOH, I can
easily go out and get 3.10.3 (or whatever kernel du jour there might be);  etc.

For dmesg, I assume (but please confirm):

NOUVEAU_DEBUG=7
nouveau.debug=PDISP=spam

For patches:  only dmesg-3? or what else exactly?.

BTW:  Don't worry about X.  I ain't gonna touch it this time :)

Thanks,
-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374932599.cD68c84b0.12779--

--===============0973628670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0973628670==--

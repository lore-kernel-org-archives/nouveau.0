From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 19:59:01 +0000
Message-ID: <bug-79266-8800-PzJ1HWrqDD@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1702489041=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1702489041==
Content-Type: multipart/alternative; boundary="1401134341.c7Cdc26B1.17814"; charset="us-ascii"


--1401134341.c7Cdc26B1.17814
Date: Mon, 26 May 2014 19:59:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #13 from C0NPAQ <afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org> ---
OK, I switched back to nividia driver.

My setup is 3 monitors, from left to right 1200x1024, 1920x1080,1080x1920. I
have two identical GT430 and 6 outputs total are possible. Before I tell you
that I used Option "ZaphodHeads" and "monitor-[OUTPUT NAME]" (whatever that is
called, and it is documented nowhere but it works) in xorg, let me tell you
that the sluggishness definitively has nothing to do with it, since the first
thing I did when I noticed it was to run without xorg.conf and use only one
screen. Sometimes the 'mouse-wiggle' occurs sometimes it doesn't. Maybe the
crashes get worse if I use multiple screens but definitively the whole system
crashes either way, single screen or not.

I will upload a video to youtube, I recorded with my mobile phone, of the
mouse-wiggle issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401134341.c7Cdc26B1.17814
Date: Mon, 26 May 2014 19:59:01 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:afasdfsdfaa&#64;master.ms" title="C0NPAQ &lt;afasdfsdfaa&#64;master.ms&gt;"> <span class="fn">C0NPAQ</span></a>
</span></b>
        <pre>OK, I switched back to nividia driver.

My setup is 3 monitors, from left to right 1200x1024, 1920x1080,1080x1920. I
have two identical GT430 and 6 outputs total are possible. Before I tell you
that I used Option &quot;ZaphodHeads&quot; and &quot;monitor-[OUTPUT NAME]&quot; (whatever that is
called, and it is documented nowhere but it works) in xorg, let me tell you
that the sluggishness definitively has nothing to do with it, since the first
thing I did when I noticed it was to run without xorg.conf and use only one
screen. Sometimes the 'mouse-wiggle' occurs sometimes it doesn't. Maybe the
crashes get worse if I use multiple screens but definitively the whole system
crashes either way, single screen or not.

I will upload a video to youtube, I recorded with my mobile phone, of the
mouse-wiggle issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401134341.c7Cdc26B1.17814--

--===============1702489041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1702489041==--

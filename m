From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 16:27:30 +0000
Message-ID: <bug-79266-8800-AhjQFiq5rX@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1499931070=="
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


--===============1499931070==
Content-Type: multipart/alternative; boundary="1401121649.6cc341.7560"; charset="us-ascii"


--1401121649.6cc341.7560
Date: Mon, 26 May 2014 16:27:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #2 from C0NPAQ <afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org> ---
Yes, this is a ramble but it is so by necessity. The random crashes, random
mplayer behavior in combination with vdpau, suspend issues, etc. it all speaks
for a single cause issue. I know very similar behavior (crashes, suspend
issues) from the proprietary drivers with other cards (GT8400) where the
nouveau driver works and the proprietary driver causes the problems. Those
issues are simply (in that case) not implementation/firmware related and I
doubt they are here, that's why it is important to mention all of this
'ramble'.

(a), no one cares if the card is running 1/2 memory speed because it still is
way fast enough and it has nothing to do with it or to contribute to the issue
afaik.

(b) sounds like you equally are just guessing around but have no clue what is
going on

(c) if you read the documentation you knew that GLXVblank is documented, hence
I tried it, hence it did nothing as mentioned



I realize this bug is difficult, but if you got a GT430 you basically have to
use nvidia and can't use nouveau. Google a bit, you will find *all* of the
desribed issues scattered around the net.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401121649.6cc341.7560
Date: Mon, 26 May 2014 16:27:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:afasdfsdfaa&#64;master.ms" title="C0NPAQ &lt;afasdfsdfaa&#64;master.ms&gt;"> <span class="fn">C0NPAQ</span></a>
</span></b>
        <pre>Yes, this is a ramble but it is so by necessity. The random crashes, random
mplayer behavior in combination with vdpau, suspend issues, etc. it all speaks
for a single cause issue. I know very similar behavior (crashes, suspend
issues) from the proprietary drivers with other cards (GT8400) where the
nouveau driver works and the proprietary driver causes the problems. Those
issues are simply (in that case) not implementation/firmware related and I
doubt they are here, that's why it is important to mention all of this
'ramble'.

(a), no one cares if the card is running 1/2 memory speed because it still is
way fast enough and it has nothing to do with it or to contribute to the issue
afaik.

(b) sounds like you equally are just guessing around but have no clue what is
going on

(c) if you read the documentation you knew that GLXVblank is documented, hence
I tried it, hence it did nothing as mentioned



I realize this bug is difficult, but if you got a GT430 you basically have to
use nvidia and can't use nouveau. Google a bit, you will find *all* of the
desribed issues scattered around the net.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401121649.6cc341.7560--

--===============1499931070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1499931070==--

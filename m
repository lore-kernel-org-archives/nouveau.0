From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34220] Detects Load on output and blinks screen
	every ~30secs
Date: Tue, 25 Feb 2014 23:10:04 +0000
Message-ID: <bug-34220-8800-pMqUqLIm1k@http.bugs.freedesktop.org/>
References: <bug-34220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1961641257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1961641257==
Content-Type: multipart/alternative; boundary="1393369805.1742bA1a5.8292"; charset="us-ascii"


--1393369805.1742bA1a5.8292
Date: Tue, 25 Feb 2014 23:10:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=34220

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #12)
> I can confirm that blinking issue after cat
> /sys/class/drm/card0-VGA-0/status every ~30 seconds. I'm using nvidia 7300
> gt. do you need more data?

I'm very confused by your comment. Does cat'ing the status cause an immediate
blink, yes or no? (Your comment, taken literally, seems to imply that things
are all fine, then you cat the file, and then the blink happens every 30s. This
seems unlikely.)

What kernel version are you using?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393369805.1742bA1a5.8292
Date: Tue, 25 Feb 2014 23:10:05 +0000
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
   title="NEW --- - Detects Load on output and blinks screen every ~30secs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34220#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Detects Load on output and blinks screen every ~30secs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34220">bug 34220</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=34220#c12">comment #12</a>)
<span class="quote">&gt; I can confirm that blinking issue after cat
&gt; /sys/class/drm/card0-VGA-0/status every ~30 seconds. I'm using nvidia 7300
&gt; gt. do you need more data?</span >

I'm very confused by your comment. Does cat'ing the status cause an immediate
blink, yes or no? (Your comment, taken literally, seems to imply that things
are all fine, then you cat the file, and then the blink happens every 30s. This
seems unlikely.)

What kernel version are you using?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393369805.1742bA1a5.8292--

--===============1961641257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1961641257==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforece 4
Date: Mon, 10 Feb 2014 12:20:21 +0000
Message-ID: <bug-54587-8800-EDLwP44Urz@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0402911338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0402911338==
Content-Type: multipart/alternative; boundary="1392034821.eCBEa82.8156"; charset="us-ascii"


--1392034821.eCBEa82.8156
Date: Mon, 10 Feb 2014 12:20:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54587

--- Comment #32 from Vesa <piip-O5WfVfzUwx8@public.gmane.org> ---
I tried to get mmiotrace log file. I had to manually stop generating it after
it was 400 megs long. It seems to be almost full of consecutive memory writes.
I copied some lines from it to an attachment. Hopefully these lines are useful.

Maybe nvidia people are now willing to help...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392034821.eCBEa82.8156
Date: Mon, 10 Feb 2014 12:20:21 +0000
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
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587">bug 54587</a>
              from <span class="vcard"><a class="email" href="mailto:piip&#64;mail.com" title="Vesa &lt;piip&#64;mail.com&gt;"> <span class="fn">Vesa</span></a>
</span></b>
        <pre>I tried to get mmiotrace log file. I had to manually stop generating it after
it was 400 megs long. It seems to be almost full of consecutive memory writes.
I copied some lines from it to an attachment. Hopefully these lines are useful.

Maybe nvidia people are now willing to help...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392034821.eCBEa82.8156--

--===============0402911338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0402911338==--

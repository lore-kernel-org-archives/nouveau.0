From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75203] Asus Maximus IV GENE-Z - Nvidia GTX660 -
 Strange pink line on left screen side
Date: Wed, 19 Feb 2014 14:46:15 +0000
Message-ID: <bug-75203-8800-46ZRNwdksU@http.bugs.freedesktop.org/>
References: <bug-75203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0409415609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0409415609==
Content-Type: multipart/alternative; boundary="1392821175.02D87c2.1966"; charset="us-ascii"


--1392821175.02D87c2.1966
Date: Wed, 19 Feb 2014 14:46:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75203

--- Comment #5 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Vincent

Looking at your launchpad bug it seems that you're using old version of
xserver-xorg-video-nouveau(1.0.7), amongst others.

Can you update to:
* libdrm            2.4.52
* Mesa                10.0.3
* xserver-xorg-video-nouveau    1.0.10

Additionally does the pink line appear in VT or is it present only within X ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392821175.02D87c2.1966
Date: Wed, 19 Feb 2014 14:46:15 +0000
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
   title="NEW --- - Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203">bug 75203</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Vincent

Looking at your launchpad bug it seems that you're using old version of
xserver-xorg-video-nouveau(1.0.7), amongst others.

Can you update to:
* libdrm            2.4.52
* Mesa                10.0.3
* xserver-xorg-video-nouveau    1.0.10

Additionally does the pink line appear in VT or is it present only within X ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392821175.02D87c2.1966--

--===============0409415609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0409415609==--

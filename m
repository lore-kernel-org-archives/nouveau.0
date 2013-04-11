From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] Xv video support is black on NVidia NVa8
 Chipset in latest git [fixed with patch]
Date: Thu, 11 Apr 2013 19:01:15 +0000
Message-ID: <bug-51579-8800-qxu9W2KLo1@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443266661=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51579-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1443266661==
Content-Type: multipart/alternative; boundary="1365706875.8CD80A223.22169"; charset="us-ascii"


--1365706875.8CD80A223.22169
Date: Thu, 11 Apr 2013 19:01:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

--- Comment #21 from Duane Robertson <hnxcyllh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm using version 1.13 of the gentoo xorg-driver package with nouveau selected,
and I get exactly the same issue. My card is an ASUS 210. Of course, the nvidia
driver works perfectly. Mplayer shows videos in gl, gl2, and x11, but not xv.

Oddly, the problem did not occur when I first installed the card. I put it in
and booted with the nvidia driver, then changed over to the nouveau driver,
then removed nvidia and continued to test, restarting at each step. Mplayer
worked normally at every stage. Then I shut down to put the box back together,
restarted, and... black video.

Next I reinstalled the nvidia driver, loaded it, and saw normal video. The
nouveau still has the same issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365706875.8CD80A223.22169
Date: Thu, 11 Apr 2013 19:01:15 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Xv video support is black on NVidia NVa8 Chipset in latest git [fixed with patch]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Xv video support is black on NVidia NVa8 Chipset in latest git [fixed with patch]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:hnxcyllh&#64;gmail.com" title="Duane Robertson &lt;hnxcyllh&#64;gmail.com&gt;"> <span class="fn">Duane Robertson</span></a>
</span></b>
        <pre>I'm using version 1.13 of the gentoo xorg-driver package with nouveau selected,
and I get exactly the same issue. My card is an ASUS 210. Of course, the nvidia
driver works perfectly. Mplayer shows videos in gl, gl2, and x11, but not xv.

Oddly, the problem did not occur when I first installed the card. I put it in
and booted with the nvidia driver, then changed over to the nouveau driver,
then removed nvidia and continued to test, restarting at each step. Mplayer
worked normally at every stage. Then I shut down to put the box back together,
restarted, and... black video.

Next I reinstalled the nvidia driver, loaded it, and saw normal video. The
nouveau still has the same issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365706875.8CD80A223.22169--

--===============1443266661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1443266661==--

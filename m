From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75203] [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660
 - Strange pink line on left screen side
Date: Mon, 15 Sep 2014 23:29:23 +0000
Message-ID: <bug-75203-8800-aCcqH2j3PT@http.bugs.freedesktop.org/>
References: <bug-75203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0463242205=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0463242205==
Content-Type: multipart/alternative; boundary="1410823763.a1887c3.581"; charset="us-ascii"


--1410823763.a1887c3.581
Date: Mon, 15 Sep 2014 23:29:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75203

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like Ben made a more complete fix, now available as part of

http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.18

More specifically

http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&id=a522946174b5ae389af0856c422d865a63c70316

Please test & confirm.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410823763.a1887c3.581
Date: Mon, 15 Sep 2014 23:29:23 +0000
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
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203">bug 75203</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like Ben made a more complete fix, now available as part of

<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.18">http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.18</a>

More specifically

<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&amp;id=a522946174b5ae389af0856c422d865a63c70316">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&amp;id=a522946174b5ae389af0856c422d865a63c70316</a>

Please test &amp; confirm.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410823763.a1887c3.581--

--===============0463242205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0463242205==--

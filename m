From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74492] v3.13-rc8 nv4e + msi = random lockups
Date: Wed, 05 Feb 2014 19:35:10 +0000
Message-ID: <bug-74492-8800-6xgAzgQ3by@http.bugs.freedesktop.org/>
References: <bug-74492-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1543375339=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74492-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1543375339==
Content-Type: multipart/alternative; boundary="1391628910.87aDA0a82.30335"; charset="us-ascii"


--1391628910.87aDA0a82.30335
Date: Wed, 5 Feb 2014 19:35:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74492

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like the nv4x igp's have some registers placed differently... I just cc'd
you on a few patches, you can also get them at:

http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html
http://lists.freedesktop.org/archives/nouveau/2014-February/016033.html
http://lists.freedesktop.org/archives/nouveau/2014-February/016034.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391628910.87aDA0a82.30335
Date: Wed, 5 Feb 2014 19:35:10 +0000
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
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492">bug 74492</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like the nv4x igp's have some registers placed differently... I just cc'd
you on a few patches, you can also get them at:

<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html</a>
<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016033.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016033.html</a>
<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016034.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016034.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391628910.87aDA0a82.30335--

--===============1543375339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1543375339==--

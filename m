From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47796] Powerpoint 2010 Viewer crashes with Wine and
 the Nouveau driver: "Unhandled exception: assertion failed"
Date: Sun, 13 Jan 2013 01:08:41 +0000
Message-ID: <bug-47796-8800-Cm12icw05s@http.bugs.freedesktop.org/>
References: <bug-47796-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0202943804=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47796-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0202943804==
Content-Type: multipart/alternative; boundary="1358039321.f4f466B1.29376"; charset="us-ascii"


--1358039321.f4f466B1.29376
Date: Sun, 13 Jan 2013 01:08:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47796

--- Comment #4 from Trek <trek00-aPYA7nAdAYY@public.gmane.org> ---
After doing some search, I found another patch that could address this bug:

http://lists.freedesktop.org/archives/nouveau/2012-July/010706.html

I am sorry but my limited knowledge about the mesa code do not let me to know
what issue is related to this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358039321.f4f466B1.29376
Date: Sun, 13 Jan 2013 01:08:41 +0000
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
   title="NEW --- - Powerpoint 2010 Viewer crashes with Wine and the Nouveau driver: &quot;Unhandled exception: assertion failed&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47796#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Powerpoint 2010 Viewer crashes with Wine and the Nouveau driver: &quot;Unhandled exception: assertion failed&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47796">bug 47796</a>
              from <span class="vcard"><a class="email" href="mailto:trek00&#64;inbox.ru" title="Trek &lt;trek00&#64;inbox.ru&gt;"> <span class="fn">Trek</span></a>
</span></b>
        <pre>After doing some search, I found another patch that could address this bug:

<a href="http://lists.freedesktop.org/archives/nouveau/2012-July/010706.html">http://lists.freedesktop.org/archives/nouveau/2012-July/010706.html</a>

I am sorry but my limited knowledge about the mesa code do not let me to know
what issue is related to this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358039321.f4f466B1.29376--

--===============0202943804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0202943804==--

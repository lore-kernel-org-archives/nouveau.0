From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60050] Fonts not displayed
Date: Thu, 31 Jan 2013 01:24:44 +0000
Message-ID: <bug-60050-8800-JGb9ALJEOa@http.bugs.freedesktop.org/>
References: <bug-60050-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281707088=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60050-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1281707088==
Content-Type: multipart/alternative; boundary="1359595484.e8dF1Ec2.30073"; charset="us-ascii"


--1359595484.e8dF1Ec2.30073
Date: Thu, 31 Jan 2013 01:24:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60050

--- Comment #8 from Julio Merino <jmmv-qavaossjCcEdnm+yROfE0A@public.gmane.org> ---
Marcin: This patch does indeed seem to fix the problem. I applied it to version
1.0.1, rebuilt the package, reenabled acceleration and, voila, the fonts appear
just fine. Thanks a lot!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359595484.e8dF1Ec2.30073
Date: Thu, 31 Jan 2013 01:24:44 +0000
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
   title="NEW --- - Fonts not displayed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60050#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fonts not displayed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60050">bug 60050</a>
              from <span class="vcard"><a class="email" href="mailto:jmmv&#64;NetBSD.org" title="Julio Merino &lt;jmmv&#64;NetBSD.org&gt;"> <span class="fn">Julio Merino</span></a>
</span></b>
        <pre>Marcin: This patch does indeed seem to fix the problem. I applied it to version
1.0.1, rebuilt the package, reenabled acceleration and, voila, the fonts appear
just fine. Thanks a lot!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359595484.e8dF1Ec2.30073--

--===============1281707088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1281707088==--

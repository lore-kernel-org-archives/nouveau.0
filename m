From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57660] [NVA3:NVC0] Turn on support for
	PIPE_CAP_CUBE_MAP_ARRAY
Date: Fri, 07 Feb 2014 22:48:43 +0000
Message-ID: <bug-57660-8800-Ersbbmzcmx@http.bugs.freedesktop.org/>
References: <bug-57660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0225695162=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0225695162==
Content-Type: multipart/alternative; boundary="1391813323.Db2fEff1.3308"; charset="us-ascii"


--1391813323.Db2fEff1.3308
Date: Fri, 7 Feb 2014 22:48:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57660

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 93636
  --> https://bugs.freedesktop.org/attachment.cgi?id=93636&action=edit
cubemap array patch

Well, this fixes the one place I found by copying what nvc0 did. But from
Martin's test it seems like this probably won't be sufficient, since this just
takes layer offsets into account.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391813323.Db2fEff1.3308
Date: Fri, 7 Feb 2014 22:48:43 +0000
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
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660">bug 57660</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=93636" name="attach_93636" title="cubemap array patch">attachment 93636</a> <a href="attachment.cgi?id=93636&amp;action=edit" title="cubemap array patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=57660&amp;attachment=93636'>[review]</a>
cubemap array patch

Well, this fixes the one place I found by copying what nvc0 did. But from
Martin's test it seems like this probably won't be sufficient, since this just
takes layer offsets into account.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391813323.Db2fEff1.3308--

--===============0225695162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0225695162==--

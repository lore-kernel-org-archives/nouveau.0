From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74485] [NVE6] system hangs with 3D applications
Date: Wed, 12 Feb 2014 20:21:52 +0000
Message-ID: <bug-74485-8800-Ta9Z6lyYps@http.bugs.freedesktop.org/>
References: <bug-74485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0464082544=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0464082544==
Content-Type: multipart/alternative; boundary="1392236512.5FfDf4060.17067"; charset="us-ascii"


--1392236512.5FfDf4060.17067
Date: Wed, 12 Feb 2014 20:21:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74485

--- Comment #2 from prg-uDMUqRiVvSc@public.gmane.org ---
Created attachment 93959
  --> https://bugs.freedesktop.org/attachment.cgi?id=93959&action=edit
workaround for the issue

calim on #nouveau suggested this workaround which seems to disable some kind of
compression or something. I've tested for a few days and indeed I haven't heard
from this PLTCG thing anymore since applying that patch. The previously
mentioned games are perfectly usable now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392236512.5FfDf4060.17067
Date: Wed, 12 Feb 2014 20:21:52 +0000
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
   title="NEW --- - [NVE6] system hangs with 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74485#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] system hangs with 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74485">bug 74485</a>
              from <span class="vcard"><a class="email" href="mailto:prg&#64;cooco.de" title="prg&#64;cooco.de">prg&#64;cooco.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=93959" name="attach_93959" title="workaround for the issue">attachment 93959</a> <a href="attachment.cgi?id=93959&amp;action=edit" title="workaround for the issue">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=74485&amp;attachment=93959'>[review]</a>
workaround for the issue

calim on #nouveau suggested this workaround which seems to disable some kind of
compression or something. I've tested for a few days and indeed I haven't heard
from this PLTCG thing anymore since applying that patch. The previously
mentioned games are perfectly usable now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392236512.5FfDf4060.17067--

--===============0464082544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0464082544==--

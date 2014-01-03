From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] Nouveau: corrupted laptop screen's EDID info
Date: Fri, 03 Jan 2014 23:51:48 +0000
Message-ID: <bug-73267-8800-wyhOqQdk2d@http.bugs.freedesktop.org/>
References: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1525365607=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1525365607==
Content-Type: multipart/alternative; boundary="1388793108.E3B82daB1.12107"; charset="us-ascii"


--1388793108.E3B82daB1.12107
Date: Fri, 3 Jan 2014 23:51:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

--- Comment #4 from pjv <ezelspinguin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ilia, is it sane to enforce an EDID in the module options? I have the habit to
copy all my configuration when moving to a new laptop when it's time to
replace, and then forget what this or that fix was for. I bet I would have a
hard time getting my screen to show then.

Can I help to diagnose where the corruption comes from? Is that useful/doable?

I should also mention that Apple might have had some particular problems with
this laptop model (MBP 6,2) related to the Nvidia chip:
http://support.apple.com/kb/ts4088. This is like a recall problem for affected
parts. Can't find enough info though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388793108.E3B82daB1.12107
Date: Fri, 3 Jan 2014 23:51:48 +0000
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
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
              from <span class="vcard"><a class="email" href="mailto:ezelspinguin&#64;gmail.com" title="pjv &lt;ezelspinguin&#64;gmail.com&gt;"> <span class="fn">pjv</span></a>
</span></b>
        <pre>Ilia, is it sane to enforce an EDID in the module options? I have the habit to
copy all my configuration when moving to a new laptop when it's time to
replace, and then forget what this or that fix was for. I bet I would have a
hard time getting my screen to show then.

Can I help to diagnose where the corruption comes from? Is that useful/doable?

I should also mention that Apple might have had some particular problems with
this laptop model (MBP 6,2) related to the Nvidia chip:
<a href="http://support.apple.com/kb/ts4088">http://support.apple.com/kb/ts4088</a>. This is like a recall problem for affected
parts. Can't find enough info though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388793108.E3B82daB1.12107--

--===============1525365607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1525365607==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69376] F19 Gnome-3 does not display icons for All
	Applications
Date: Sun, 15 Sep 2013 15:00:08 +0000
Message-ID: <bug-69376-8800-y6Lh76xUEO@http.bugs.freedesktop.org/>
References: <bug-69376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0681176916=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69376-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0681176916==
Content-Type: multipart/alternative; boundary="1379257207.7eced2.30536"; charset="us-ascii"


--1379257207.7eced2.30536
Date: Sun, 15 Sep 2013 15:00:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69376

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You would need to retrieve the code and rebuild mesa (note that fedora and
other distributions split mesa into lots of separate packages)

Upon rebuilding you can either create a RPM package (A) or use it from
standalone location (B).

A) With regards to rebuilding and installing a RPM, this article [1] will be of
use, as well as the fedora irc channel. Note that you do not need to
write/create a mesa.spec file, a simple copy of the current one used by fedora
should work like a charm (remember to bump the version number).

B) Whereas if you prefer to build and install mesa to a separate location our
wiki has some instructions on how you can do that [2]. Note in this case may
have to resolve build dependencies, and configure flags by checking with
fedora's mesa.spec file.


[1] http://fedoraproject.org/wiki/How_to_create_an_RPM_package
[2] http://nouveau.freedesktop.org/wiki/InstallNouveau/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379257207.7eced2.30536
Date: Sun, 15 Sep 2013 15:00:07 +0000
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
   title="NEW --- - F19 Gnome-3 does not display icons for All Applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69376#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - F19 Gnome-3 does not display icons for All Applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69376">bug 69376</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>You would need to retrieve the code and rebuild mesa (note that fedora and
other distributions split mesa into lots of separate packages)

Upon rebuilding you can either create a RPM package (A) or use it from
standalone location (B).

A) With regards to rebuilding and installing a RPM, this article [1] will be of
use, as well as the fedora irc channel. Note that you do not need to
write/create a mesa.spec file, a simple copy of the current one used by fedora
should work like a charm (remember to bump the version number).

B) Whereas if you prefer to build and install mesa to a separate location our
wiki has some instructions on how you can do that [2]. Note in this case may
have to resolve build dependencies, and configure flags by checking with
fedora's mesa.spec file.


[1] <a href="http://fedoraproject.org/wiki/How_to_create_an_RPM_package">http://fedoraproject.org/wiki/How_to_create_an_RPM_package</a>
[2] <a href="http://nouveau.freedesktop.org/wiki/InstallNouveau/">http://nouveau.freedesktop.org/wiki/InstallNouveau/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379257207.7eced2.30536--

--===============0681176916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0681176916==--

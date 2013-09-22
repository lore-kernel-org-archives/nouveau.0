From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Sun, 22 Sep 2013 09:45:09 +0000
Message-ID: <bug-60680-8800-k8XTL6H21r@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1419986425=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1419986425==
Content-Type: multipart/alternative; boundary="1379843108.8bE73582.28321"; charset="us-ascii"


--1379843108.8bE73582.28321
Date: Sun, 22 Sep 2013 09:45:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #12 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
http://people.freedesktop.org/~pq/mmiotrace-fdo-bug-60680.tar.xz (8.8 MB)

You can find a package containing mmiotraces from the last good and the first
bad kernel revision in the above URL. The traces contain the following marks.

Good:
MARK 11.701343 before begin
MARK 38.640046 nouveau loaded, TV has fbcon
MARK 39.232127 going to start X
MARK 64.224171 X is up, TV has picture
MARK 87.013208 going to change to TV-only
MARK 93.579942 TV is on with full-HD mode
MARK 97.452990 switched to LVDS-only

Bad:
MARK 16.029575 before begin
MARK 46.718026 nouveau loaded, no signal on TV
MARK 47.340368 going to start X
MARK 71.961538 X is up, no signal on TV
MARK 74.445054 going to switch to TV-only full-HD
MARK 84.561667 done, I'm blind
MARK 87.738044 switched to LVDS-only

The command to set the TV-only full-HD mode is:
$ xrandr --output LVDS-1 --off --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None'

The command to set the LVDS-only mode is:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --off

Note that by default Nouveau (fbcon and X) light up both outputs as clones when
it works, just like I've described before.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379843108.8bE73582.28321
Date: Sun, 22 Sep 2013 09:45:08 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre><a href="http://people.freedesktop.org/~pq/mmiotrace-fdo-bug-60680.tar.xz">http://people.freedesktop.org/~pq/mmiotrace-fdo-bug-60680.tar.xz</a> (8.8 MB)

You can find a package containing mmiotraces from the last good and the first
bad kernel revision in the above URL. The traces contain the following marks.

Good:
MARK 11.701343 before begin
MARK 38.640046 nouveau loaded, TV has fbcon
MARK 39.232127 going to start X
MARK 64.224171 X is up, TV has picture
MARK 87.013208 going to change to TV-only
MARK 93.579942 TV is on with full-HD mode
MARK 97.452990 switched to LVDS-only

Bad:
MARK 16.029575 before begin
MARK 46.718026 nouveau loaded, no signal on TV
MARK 47.340368 going to start X
MARK 71.961538 X is up, no signal on TV
MARK 74.445054 going to switch to TV-only full-HD
MARK 84.561667 done, I'm blind
MARK 87.738044 switched to LVDS-only

The command to set the TV-only full-HD mode is:
$ xrandr --output LVDS-1 --off --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None'

The command to set the LVDS-only mode is:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --off

Note that by default Nouveau (fbcon and X) light up both outputs as clones when
it works, just like I've described before.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379843108.8bE73582.28321--

--===============1419986425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1419986425==--

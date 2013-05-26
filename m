From: Maarten Maathuis <madman2003@gmail.com>
Subject: [REGRESSION] system does not resume from ram due to commit
	"drm/nv50/fifo: prevent races between clients updating playlists"
Date: Sun, 26 May 2013 23:09:09 +0200
Message-ID: <CAGZ4FET7yZ0zpWen1HtaQ+tT8s08cYzTL=_QkTOvgiy0=FnJgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0144470775=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

--===============0144470775==
Content-Type: multipart/alternative; boundary=089e0149c468722c3904dda571b1

--089e0149c468722c3904dda571b1
Content-Type: text/plain; charset=ISO-8859-1

My NV96 does not resume from suspend to ram (the screen stays black, magic
sysrq keys do work) with the current linus git kernel, i bisected it to the
following commit.

drm/nv50/fifo: prevent races between clients updating playlists
b5096566f6e1ee2b88324772f020ae9bc0cfa9a0

It's not obvious to me how this causes problems, but reverting this commit
does solve my problem.
-- 
Far away from the primal instinct, the song seems to fade away, the river
get wider between your thoughts and the things we do and say.

--089e0149c468722c3904dda571b1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My NV96 does not resume from suspend to ram (the screen st=
ays black, magic sysrq keys do work) with the current linus git kernel, i b=
isected it to the following commit.<br><br>drm/nv50/fifo: prevent races bet=
ween clients updating playlists<br>
b5096566f6e1ee2b88324772f020ae9bc0cfa9a0<br clear=3D"all"><div><div><br></d=
iv><div>It&#39;s not obvious to me how this causes problems, but reverting =
this commit does solve my problem.<br></div><div>-- <br>Far away from the p=
rimal instinct, the song seems to fade away, the river get wider between yo=
ur thoughts and the things we do and say.
</div></div></div>

--089e0149c468722c3904dda571b1--

--===============0144470775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0144470775==--

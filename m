From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/6] Nouveau on ARM fixes
Date: Wed, 28 Aug 2013 09:50:49 +0200
Message-ID: <20130828075048.GA23220@ulmo>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0589660387=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============0589660387==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2013 at 02:00:44AM +0200, Lucas Stach wrote:
> This is the first set of patches to make Nouveau work
> on Tegra.

Perhaps you should clarify that this patch series allows discrete GPUs
to be used via Tegra's PCIe interface.

People might misinterpret...

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHavYAAoJEN0jrNd/PrOhE0cP/1Dqer5I/4OlXeTcldsATcm0
CiOoIUu6pPoP2k3/tuW6voi+iuY+nLL7N2YSMaZh4w2HdHkYz7p3KsLcGwPZQUEI
Hdkir60MWjbs/nmiBxTguavEmbEZGF3FqeMFwL4SnwuSqxzSQR78QkDYG3nvT2UI
zc9STqGAaM3sZZHUb4TPEEPhCDTL+c0nAJzBYWVoAgbawC2L8iq0eR9a8iWY1JZx
A00EUdhKP4QR193BH5o1UgW0qeMeYe3XdpcOiZjlGZXA851gNfhxNDBCidY+M7CS
817m0PHjM9/gkyFLPsNQmQVNWhNEvVUaoa7ZPbaD1EOtIJFcTatHPRB9gEhC18ZH
rauVW66UizFndNHVCBiT0Gc1ktVUkkdMI+tkdVrke2pKryR7LF8GwbGsdc1yZtH7
nd4uX3MVIbGd7s/6oO82gGGi8NPut2cCTbYEyw6hZ32lhFiuGxa4b9B2AfM5szwx
G5Xxo5ED4qHxV3NRKhY6dtE85JMp30rxIhtD9nLMNLTVTIUE/zSB+aXc2gK1Wt6a
fhRBsnA2T4GVTlfshuCWgV8kn69w8FzMheYjNYXswv6dRm1JEZ10zyrVzNQRI0uL
SKPVG712afQUZbzb3choA6DSDTcP9011k1ofQMKTo4EbNoIpPT4mf2dfYtXl5To8
+InSr46Dl8zirC4g4Wid
=QZVd
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

--===============0589660387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0589660387==--

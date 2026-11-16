Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B5606A31C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=VmPp7q7i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=VoHxj1Ix
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A446410EB76;
	Tue, 17 Nov 2026 15:33:58 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 06051494C2;
	Tue, 17 Nov 2026 15:14:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794928439;
 b=I3y4YEE5b1LsTjbeVrFqkATBi8i7knhhEAZWj5PCSrlxObUcq5rCct8RDoYhZeBmRAdJJ
 xpz4nobcGWlf3oO9sXH34684XXOIaSO1NgeuPcA6j4vZhgJfNg22WPG3PCO7CwCPzQ+gxXW
 L6fHzRpYqIVmfvNxSqPr4QX/JJWyJa/6/XQWTUNSUnU2nExd06BfStAk/3zDLW3uS1cKyfG
 r384oLrUv7OyYZx8+eLDusT7n7qDnCWUoCOO/7bmOklP4scF/eVqelJVcxfPWFCF0JCwBp5
 n7Of2WGgGEHFcM2ZeabGwKF7HsrQUa5Ky5TSa9CutuEHfU4rHTz3oCfd7iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794928439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OoLTYMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=;
 b=ZjpUU7uTBI5ICgWZfoTMUuURzfRMeN8u68HJGCZdFU2i8nQDL4tDm4MG2c0JPw2/XNSR1
 AcZe2EMoD4xwlevbk5zF3XucwIiwJinW0CcUqbUfFm5bNKuZJSpL6wxZAqBP1uuIz9qk4B8
 rVRYQ+iaV+QYMIi93o7OtNbp8GLSn0kQ3tVtEXOWs432oMz1kWND+5GVcW9UFFXbV7WmbxU
 +QI0xFobsJlOJWRsYKAdG1NbKTrlBpEYtdXJzr21L609zZ2sUtoduA9BAPNUI59XwHIGmQS
 JIojMUUdZ6GW0OWBpBpZd/G8ybk6zwUwAolfgahBS7W6KNzBhF3LJgCsEwUQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=columbia.edu;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=columbia.edu;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=columbia.edu
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F2C849405
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 20:15:51 +0000 (UTC)
X-Greylist: delayed 1852 seconds by postgrey-1.36 at gabe;
 Mon, 16 Nov 2026 20:35:31 UTC
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5654310F453
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 20:35:31 +0000 (UTC)
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJXJZ42978981
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=OoLT
	YMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=; b=VmPp7q7ixR/GQmSlNvEE
	kjmcyohLdB0C4sFEehPP88ZgwKMUFwGkFDkqrb2shv1Cy7FPgg0x0r+Z9sjlHc/U
	NuVTsGNgAkBRak1je4y8WwazCm93d9hmEu/dCxQbQ6BBI9tkC8MGMN0GJDzDzYAo
	HXE0iPoGzC2ycj9VXVdzPX8bPAyV8R+vEwZEIpKQksNa8VmYKjUSxaECMxx4RK5y
	MrHC1Dhn2b4sQDsej82n76kYp/RVPD1H3+7ugnCS/qVwCiaN6+h17CRFn6ZUWi6t
	zHDCuP5vvBjNK3/GrhKIuVowWPwAE7dn9kj1ax/2kXEjEk1RejzlGDP8vTHQCmbk
	yw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sa2mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 15:04:38 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91f10c68ccbso4725216d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859478; x=1795464278;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoLTYMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=;
        b=VoHxj1IxpV5kzXNDW4IRh52AdWUOlr+2E349JsxlV73W2I/0efxUwPJQHpzS6GPb8r
         Ih7jCC9c2+tENZHu/UMP3w3MOK8hSW7rPl2BlebyGmT59qUntjjqsbCW7vazSHBfV3Nz
         1bunvatscjfYXvKBLjuKpplW3rshm2Mb6SkLwErEfStxznglhyzYs7jSUCMPPrvS6bZO
         pR7JeswQWB9KLXZztT8mKaK5om3+Sqsfjkr/IPQw0xTHIy8YIR0X36jEbjLyWotkhJPY
         mqsQmea6JuaChL05spm3jwa9t0UEkp3mZFyaHkEH+MWKqhGv7Lbh9nJXGqQ6BgZGvsCL
         H5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859478; x=1795464278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OoLTYMlr0lZV4JPJ0qpA2+2MwBJd9qMSNSbWYReUmv4=;
        b=Q+AAUwPSQkO1131V36aYvdC4oel0BqJsYOecoq9KcD6LfbdfhsE+0qFRMw2JL/XiVz
         dH6wdldWOT5zm6hWxycbVIeGplVplgTxFOYJKPCg5pm2A6dIfuEw8HUbqNsbyYsrn1Yj
         k9Muk2W/TpTDTDnuWpoOc2IZq+5eQJ0ljNwYpPSyt8REdi6lGgmVwNCIPl3b+fU+RnmP
         WOwf6XUj9qc6bDnHrdVj1yY2hAwFJGGDVlmKm2fWcuQkImBfvA+VPD4CvQ7L/SA3Bilo
         HfyNuMLj2RzCjxhCyqqGQ93tvGD8aQEPIJbkaWdLrCOJZDqWhY57GZUdJ6Gu1E+E2VFv
         66aw==
X-Forwarded-Encrypted: i=1;
 AL+hErEHwUKAwDAo48hw4XzFnbzIBeLYeBJ1Drt3KFi2zQEXj+bKp/W34D40RncDmrlqiOje2z9mxUUK@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9RGQtmMYIrs8baGUVAIsgPqAyP5jDg0BmaBRkQMH274aNhpVqo
	Rwue5F9gz64WVu9XMuTYDI4zgTZEXBQMTzOaS+6CayFIpRU1U8StejoJmJEIYclJNK96vx8l8jz
	+Wob6MpV0Muehyagya8YJT4KXyhTKFhZe3zFsW2OhNyaLIhntPUqjC4Rvs81e014=
X-Gm-Gg: AZFdTZepJVHQ/t6PTk0PFdBUlukWcuxfJBqFwjOUhkb0+jIb9Mi8ymXCXG2qN6n3w3Z
	AMtNlf5ID9xdu+s4qosUXWdw+kr0ibqP5YyM6becuDpYT63DQaChSRpfgTvAbWNC/Dm0RXlwhEv
	/tFAamgaMYSiOq6MfchZbXQSkrWhp8wdzyjfj4w5uE/AvQy18BKnMwj3SWWGi8aoI80VPQhFn7v
	hbOtk7b6s8FLjXX4cFZUtkjW6xlbWLsDe+6qf66Sv2FE01vCo2KXmLyP/dq2N0OlbhYE1ifSu2P
	T93IRAkTkkCAZtFnokPnfdHclTHMNL9PfEy4n4ivhIZcXDted5WsK3S8KfdvcbFRe6PY0zwjVmz
	cJyXxqRoxxl3JBm3GzXd6pak4lF8oLbwT8ieoGsQ27lNNUrjdKCuiJvt1aD25NGe6Em5RZ0IsnI
	/aBqmiTLPmSEAg7SD1jjMm
X-Received: by 2002:a05:6214:404:b0:91f:3063:6b2f with SMTP id
 6a1803df08f44-920fd34f33cmr9007656d6.17.1794859477476;
        Mon, 16 Nov 2026 12:04:37 -0800 (PST)
X-Received: by 2002:a05:6214:404:b0:91f:3063:6b2f with SMTP id
 6a1803df08f44-920fd34f33cmr9006626d6.17.1794859476833;
        Mon, 16 Nov 2026 12:04:36 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:34 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:50 -0500
Subject: [PATCH v2 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-uffd-state-fixes-v2-8-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=3477;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rmChA7WgdOrC/88AxZpfJODdWq+Xphq5oh6yqVMIGRQ=;
 b=Aq8YehfZb6/OHRe5fm5im+wKKZvGIc/GWSlOLY0dwMWs4pJkhwuqJqx9nc8S+eDs6q4djpisX
 UCoLnNhweecC9FQQb7bS+LJGWbllO0Kys1HABgExaohJoPu9hSmT0f5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXxGlVRyQzfvAI
 sNEoj7lPk14mHf7zilNnBSvgc5zqpCwyd5y+fRXO/i/XXVEs9Dw+jeqiPMZRvyHoeSFPI5m/aTe
 5Vn2wmVKdnHyh0gT1Q5ZyJjdXbZ87cSjwpOEo7ALZc3FUm4Iesq5s4X/NCjN7b3tTobZPi1/wtK
 g1aU+izGPKq3l9D7EboIs/w0J4GR6W8oUraXJG5nroyf4NJCLY7VKovMSrvmepg+exQyJNoLUpL
 GAW/G8TdFtct9/aFZ0Vl5JVSEVe0F9TZZNwcU0BQr4bDENlCyBZbXZA+v456jdT3h0qm+vc5ynO
 vLdzB527le5GEeUEzSwJPMliYp95wN28XlpEYInnTbrp/T6sfmW2Av5pecBy2wgvQjuMvHUJfSe
 lBhwj+ojyGFilA2cioF3YJIiHWwQxvA4+RBRnqJ+k7yLBSbGkI6gqITdLBIzTHshbbSgtRvr0LL
 5Ic6gbP8Ic5fSC0uaog==
X-Proofpoint-ORIG-GUID: g8VRE7BLby19Y5zP9WHBBv8Q6ap32_R9
X-Proofpoint-GUID: g8VRE7BLby19Y5zP9WHBBv8Q6ap32_R9
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6afb61d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=El0B2wc1DFe8a7cR29wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX+gHVQDNjIfP2
 84Z5so+oR87nSthE9fWFUMKi8GEiOwsCGFZz2k27S+CL3DEcVqloe7e6eLxOnnKtusyKQZElfyy
 9v5ZJ9YZmWbQE9Gqjgc+6nSEn9ryygfHcLCc9CFsIG+dILWNVX59
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1011 lowpriorityscore=10
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080
X-MailFrom: tz2294@columbia.edu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: D2ZHIIVXYPQR4PQOFDOAJTD2DYBW6GLR
X-Message-ID-Hash: D2ZHIIVXYPQR4PQOFDOAJTD2DYBW6GLR
X-Mailman-Approved-At: Tue, 17 Nov 2026 15:13:57 +0000
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Tal Zussman <tz2294@columbia.edu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D2ZHIIVXYPQR4PQOFDOAJTD2DYBW6GLR/>
Archived-At: 
 <https://lore.freedesktop.org/20261116-uffd-state-fixes-v2-8-4397a0196479@columbia.edu/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device migration replaces a PTE that maps the zero page with a new PTE
that is built only from the VMA flags, so its userfaultfd WP or RWP
protection is lost. The same applies to the huge zero PMD. Writes and
accesses to the page are then no longer reported to userfaultfd.

To fix it, do not migrate a uffd-protected zero page. Skip it during
collection, and check again under the page table lock before inserting,
as another thread can protect the page after it was collected.

The alternative would be to carry the uffd state over to the new entry,
but a uffd-protected zero page in a range that a driver migrates should
be rare.

Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/migrate_device.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9e19fadfa65c..140b99f72508 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -159,7 +159,16 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
+			/*
+			 * Nothing carries the uffd state of the zero page
+			 * over, so skip it if its uffd bit is set.
+			 */
+			bool protected = userfaultfd_protected(walk->vma) &&
+					 pmd_uffd(*pmdp);
+
 			spin_unlock(ptl);
+			if (protected)
+				return migrate_vma_collect_skip(start, end, walk);
 			return migrate_vma_collect_hole(start, end, -1, walk);
 		}
 		if (pmd_write(*pmdp))
@@ -337,6 +346,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn) &&
 			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
+				/* See migrate_vma_collect_huge_pmd(). */
+				if (userfaultfd_protected(vma) && pte_uffd(pte))
+					goto next;
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
@@ -871,10 +883,14 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	if (userfaultfd_missing(vma))
 		goto unlock_abort;
 
-	if (is_huge_zero_pmd(*pmdp))
+	if (is_huge_zero_pmd(*pmdp)) {
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pmd_uffd(*pmdp))
+			goto unlock_abort;
 		flush = true;
-	else if (!pmd_none(*pmdp))
+	} else if (!pmd_none(*pmdp)) {
 		goto unlock_abort;
+	}
 
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
@@ -1074,6 +1090,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (!is_zero_pfn(pfn))
 			goto unlock_abort;
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pte_uffd(orig_pte))
+			goto unlock_abort;
 		flush = true;
 	} else if (!pte_none(orig_pte))
 		goto unlock_abort;

-- 
2.39.5

